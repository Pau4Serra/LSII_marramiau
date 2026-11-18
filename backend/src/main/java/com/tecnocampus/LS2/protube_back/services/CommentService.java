package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.Comment;
import com.tecnocampus.LS2.protube_back.model.CommentLike;
import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateCommentRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentLikeResponseDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentResponseDTO;
import com.tecnocampus.LS2.protube_back.persistance.CommentLikeRepository;
import com.tecnocampus.LS2.protube_back.persistance.CommentRepository;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class CommentService {

    private final CommentRepository commentRepository;
    private final CommentLikeRepository commentLikeRepository;
    private final UserRepository userRepository;
    private final VideoRepository videoRepository;

    public CommentService(
            CommentRepository commentRepository,
            CommentLikeRepository commentLikeRepository,
            UserRepository userRepository,
            VideoRepository videoRepository) {

        this.commentRepository = commentRepository;
        this.commentLikeRepository = commentLikeRepository;
        this.userRepository = userRepository;
        this.videoRepository = videoRepository;
    }

    @Transactional(readOnly = true)
    public List<CommentResponseDTO> getComments(UUID videoId, String googleSubject) {
        requireActiveVideo(videoId);

        List<Comment> comments = commentRepository
                .findByVideo_IdAndParentIsNullOrderByCreatedAtDesc(videoId);
        Set<UUID> commentIds = collectCommentIds(comments);
        Map<UUID, Long> localLikeCounts = getLocalLikeCounts(commentIds);
        Set<UUID> likedCommentIds = getLikedCommentIds(commentIds, googleSubject);

        return comments.stream()
                .map(comment -> comment.toDTO(localLikeCounts, likedCommentIds))
                .toList();
    }

    @Transactional
    public CommentResponseDTO createComment(
            UUID videoId,
            CreateCommentRequestDTO request,
            String googleSubject) {

        User author = requireUser(googleSubject);
        Video video = requireActiveVideo(videoId);
        Comment comment = newComment(video, author, validateContent(request));
        Comment savedComment = commentRepository.save(comment);

        return savedComment.toDTO(Map.of(), Set.of());
    }

    @Transactional
    public CommentResponseDTO createReply(
            UUID commentId,
            CreateCommentRequestDTO request,
            String googleSubject) {

        User author = requireUser(googleSubject);
        Comment parent = requireActiveComment(commentId);
        if (parent.getParent() != null) {
            throw new ResponseStatusException(
                    HttpStatus.UNPROCESSABLE_ENTITY,
                    "Replies can only be added to root comments"
            );
        }

        Comment reply = newComment(parent.getVideo(), author, validateContent(request));
        reply.setParent(parent);
        Comment savedReply = commentRepository.save(reply);

        return savedReply.toDTO(Map.of(), Set.of());
    }

    @Transactional
    public CommentLikeResponseDTO likeComment(UUID commentId, String googleSubject) {
        User user = requireUser(googleSubject);
        Comment comment = requireActiveComment(commentId);

        if (commentLikeRepository
                .findByComment_IdAndUser_Id(commentId, user.getId())
                .isEmpty()) {
            CommentLike commentLike = new CommentLike();
            commentLike.setComment(comment);
            commentLike.setUser(user);
            commentLikeRepository.save(commentLike);
        }

        return toLikeResponse(comment, true);
    }

    @Transactional
    public CommentLikeResponseDTO unlikeComment(UUID commentId, String googleSubject) {
        User user = requireUser(googleSubject);
        Comment comment = requireActiveComment(commentId);

        commentLikeRepository.deleteByComment_IdAndUser_Id(commentId, user.getId());

        return toLikeResponse(comment, false);
    }

    private Comment newComment(Video video, User author, String content) {
        Comment comment = new Comment();
        comment.setVideo(video);
        comment.setAuthor(author);
        comment.setAuthorDisplayName(getDisplayName(author));
        comment.setContent(content);
        return comment;
    }

    private Video requireActiveVideo(UUID videoId) {
        return videoRepository.findByIdAndStatus(videoId, VideoStatus.ACTIVE)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        "Active video not found"
                ));
    }

    private Comment requireActiveComment(UUID commentId) {
        Comment comment = commentRepository.findDetailedById(commentId)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND,
                        "Comment not found"
                ));

        if (comment.getVideo().getStatus() != VideoStatus.ACTIVE) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Comment not found");
        }

        return comment;
    }

    private User requireUser(String googleSubject) {
        if (googleSubject == null || googleSubject.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Authentication is required");
        }

        User user = userRepository.findUserByGoogleSubject(googleSubject);
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found");
        }
        return user;
    }

    private String validateContent(CreateCommentRequestDTO request) {
        if (request == null || request.content() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Comment content is required");
        }

        String content = request.content().strip();
        if (content.isEmpty() || content.length() > 1000) {
            throw new ResponseStatusException(
                    HttpStatus.BAD_REQUEST,
                    "Comment content must contain between 1 and 1000 characters"
            );
        }
        return content;
    }

    private String getDisplayName(User user) {
        if (user.getName() != null && !user.getName().isBlank()) {
            return user.getName();
        }
        return user.getEmail();
    }

    private Set<UUID> collectCommentIds(List<Comment> comments) {
        return comments.stream()
                .flatMap(this::flatten)
                .map(Comment::getId)
                .collect(Collectors.toCollection(HashSet::new));
    }

    private Stream<Comment> flatten(Comment comment) {
        return Stream.concat(
                Stream.of(comment),
                comment.getReplies().stream().flatMap(this::flatten)
        );
    }

    private Map<UUID, Long> getLocalLikeCounts(Collection<UUID> commentIds) {
        if (commentIds.isEmpty()) {
            return Map.of();
        }

        return commentLikeRepository.countLikesByCommentIdIn(commentIds)
                .stream()
                .collect(Collectors.toMap(
                        CommentLikeRepository.CommentLikeCount::getCommentId,
                        CommentLikeRepository.CommentLikeCount::getLikeCount
                ));
    }

    private Set<UUID> getLikedCommentIds(Collection<UUID> commentIds, String googleSubject) {
        if (commentIds.isEmpty() || googleSubject == null || googleSubject.isBlank()) {
            return Set.of();
        }

        User user = userRepository.findUserByGoogleSubject(googleSubject);
        if (user == null) {
            return Set.of();
        }

        return Set.copyOf(commentLikeRepository.findCommentIdsLikedByUser(commentIds, user.getId()));
    }

    private CommentLikeResponseDTO toLikeResponse(
            Comment comment,
            boolean likedByCurrentUser) {

        long localLikeCount = getLocalLikeCounts(Set.of(comment.getId()))
                .getOrDefault(comment.getId(), 0L);
        return new CommentLikeResponseDTO(
                comment.getId(),
                comment.getImportedLikeCount() + localLikeCount,
                likedByCurrentUser
        );
    }
}
