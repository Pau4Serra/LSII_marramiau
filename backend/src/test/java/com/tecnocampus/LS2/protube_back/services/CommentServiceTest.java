package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.Comment;
import com.tecnocampus.LS2.protube_back.model.CommentLike;
import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateCommentRequestDTO;
import com.tecnocampus.LS2.protube_back.persistance.CommentLikeRepository;
import com.tecnocampus.LS2.protube_back.persistance.CommentRepository;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyCollection;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class CommentServiceTest {

    @Mock
    private CommentRepository commentRepository;

    @Mock
    private CommentLikeRepository commentLikeRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private VideoRepository videoRepository;

    private CommentService commentService;

    @BeforeEach
    void setUp() {
        commentService = new CommentService(
                commentRepository,
                commentLikeRepository,
                userRepository,
                videoRepository
        );
    }

    @Test
    void getsLegacyCommentsWithTheirImportedLikeCounts() {
        UUID videoId = UUID.randomUUID();
        Video video = activeVideo(videoId);
        Comment comment = new Comment();
        UUID commentId = UUID.randomUUID();
        comment.setId(commentId);
        comment.setAuthorDisplayName("Legacy author");
        comment.setContent("Legacy comment");
        comment.setCreatedAt(Instant.parse("2026-01-01T00:00:00Z"));
        comment.setImportedLikeCount(5L);

        when(videoRepository.findByIdAndStatus(videoId, VideoStatus.ACTIVE)).thenReturn(Optional.of(video));
        when(commentRepository.findByVideo_IdAndParentIsNullOrderByCreatedAtDesc(videoId))
                .thenReturn(List.of(comment));
        when(commentLikeRepository.countLikesByCommentIdIn(anyCollection())).thenReturn(List.of());

        var result = commentService.getComments(videoId, null);

        assertThat(result).hasSize(1);
        assertThat(result.getFirst().author().userId()).isNull();
        assertThat(result.getFirst().author().name()).isEqualTo("Legacy author");
        assertThat(result.getFirst().likeCount()).isEqualTo(5L);
        assertThat(result.getFirst().likedByCurrentUser()).isFalse();
    }

    @Test
    void createsCommentsForTheAuthenticatedUser() {
        UUID videoId = UUID.randomUUID();
        Video video = activeVideo(videoId);
        User author = new User("subject", "author@example.com", "Author", null, null, false);
        UUID authorId = UUID.randomUUID();
        author.setId(authorId);

        when(userRepository.findUserByGoogleSubject("subject")).thenReturn(author);
        when(videoRepository.findByIdAndStatus(videoId, VideoStatus.ACTIVE)).thenReturn(Optional.of(video));
        when(commentRepository.save(any(Comment.class))).thenAnswer(invocation -> {
            Comment comment = invocation.getArgument(0);
            comment.setId(UUID.randomUUID());
            comment.setCreatedAt(Instant.parse("2026-01-01T00:00:00Z"));
            return comment;
        });

        var result = commentService.createComment(
                videoId,
                new CreateCommentRequestDTO("  Great video!  "),
                "subject"
        );

        ArgumentCaptor<Comment> savedComment = ArgumentCaptor.forClass(Comment.class);
        verify(commentRepository).save(savedComment.capture());
        assertThat(savedComment.getValue().getVideo()).isSameAs(video);
        assertThat(savedComment.getValue().getAuthor()).isSameAs(author);
        assertThat(savedComment.getValue().getContent()).isEqualTo("Great video!");
        assertThat(result.author().userId()).isEqualTo(authorId);
        assertThat(result.content()).isEqualTo("Great video!");
    }

    @Test
    void createsRepliesOnRootCommentsAndRejectsNestedReplies() {
        var root = existingComment();
        authenticatedAuthor();
        when(commentRepository.findDetailedById(root.getId())).thenReturn(Optional.of(root));
        when(commentRepository.save(any(Comment.class))).thenAnswer(invocation -> {
            Comment reply = invocation.getArgument(0);
            assertThat(reply.getParent()).isSameAs(root);
            assertThat(reply.getVideo()).isSameAs(root.getVideo());
            assertThat(reply.getAuthorDisplayName()).isEqualTo("author@example.com");
            reply.setId(UUID.randomUUID());
            return reply;
        });
        var request = new CreateCommentRequestDTO(" Reply ");
        assertThat(commentService.createReply(root.getId(), request, "subject").content()).isEqualTo("Reply");

        root.setParent(existingComment());
        assertStatus(HttpStatus.UNPROCESSABLE_ENTITY,
                () -> commentService.createReply(root.getId(), request, "subject"));
        verify(commentRepository).save(any(Comment.class));
    }

    @Test
    void repeatedLikesSaveOnceAndUnlikePreservesImportedLikes() {
        var comment = existingComment();
        var user = authenticatedAuthor();
        var existingLike = new CommentLike();
        when(commentRepository.findDetailedById(comment.getId())).thenReturn(Optional.of(comment));
        when(commentLikeRepository.findByComment_IdAndUser_Id(comment.getId(), user.getId()))
                .thenReturn(Optional.empty(), Optional.of(existingLike));
        var count = org.mockito.Mockito.mock(CommentLikeRepository.CommentLikeCount.class);
        when(count.getCommentId()).thenReturn(comment.getId());
        when(count.getLikeCount()).thenReturn(1L);
        when(commentLikeRepository.countLikesByCommentIdIn(anyCollection()))
                .thenReturn(List.of(count), List.of(count), List.of());

        var liked = commentService.likeComment(comment.getId(), "subject");
        assertThat(liked.likeCount()).isEqualTo(6);
        assertThat(liked.likedByCurrentUser()).isTrue();
        assertThat(commentService.likeComment(comment.getId(), "subject")).isEqualTo(liked);
        var unliked = commentService.unlikeComment(comment.getId(), "subject");
        assertThat(unliked.likeCount()).isEqualTo(5);
        assertThat(unliked.likedByCurrentUser()).isFalse();

        var saved = ArgumentCaptor.forClass(CommentLike.class);
        verify(commentLikeRepository).save(saved.capture());
        assertThat(saved.getValue().getComment()).isSameAs(comment);
        assertThat(saved.getValue().getUser()).isSameAs(user);
        verify(commentLikeRepository).deleteByComment_IdAndUser_Id(comment.getId(), user.getId());
    }

    @Test
    void readsRepliesWithTheCurrentUsersLikeState() {
        var root = existingComment();
        var reply = existingComment();
        root.getReplies().add(reply);
        var user = authenticatedAuthor();
        var videoId = root.getVideo().getId();
        when(videoRepository.findByIdAndStatus(videoId, VideoStatus.ACTIVE)).thenReturn(Optional.of(root.getVideo()));
        when(commentRepository.findByVideo_IdAndParentIsNullOrderByCreatedAtDesc(videoId)).thenReturn(List.of(root));
        when(commentLikeRepository.findCommentIdsLikedByUser(anyCollection(), org.mockito.ArgumentMatchers.eq(user.getId())))
                .thenReturn(List.of(reply.getId()));

        var result = commentService.getComments(videoId, "subject").getFirst();
        assertThat(result.likedByCurrentUser()).isFalse();
        assertThat(result.replies().getFirst().likedByCurrentUser()).isTrue();
    }

    @Test
    void rejectsMissingUsersAndInactiveResources() {
        var id = UUID.randomUUID();
        var request = new CreateCommentRequestDTO("Comment");
        assertStatus(HttpStatus.UNAUTHORIZED, () -> commentService.createComment(id, request, " "));
        assertStatus(HttpStatus.NOT_FOUND, () -> commentService.createComment(id, request, "unknown"));
        assertStatus(HttpStatus.NOT_FOUND, () -> commentService.getComments(id, null));
        authenticatedAuthor();
        assertStatus(HttpStatus.NOT_FOUND, () -> commentService.likeComment(id, "subject"));

        var inactiveComment = existingComment();
        inactiveComment.getVideo().setStatus(VideoStatus.PENDING);
        when(commentRepository.findDetailedById(inactiveComment.getId())).thenReturn(Optional.of(inactiveComment));
        assertStatus(HttpStatus.NOT_FOUND, () -> commentService.unlikeComment(inactiveComment.getId(), "subject"));
        verifyNoInteractions(commentLikeRepository);
    }

    @Test
    void rejectsMissingBlankAndOversizedContent() {
        authenticatedAuthor();
        var video = activeVideo(UUID.randomUUID());
        when(videoRepository.findByIdAndStatus(video.getId(), VideoStatus.ACTIVE)).thenReturn(Optional.of(video));
        assertStatus(HttpStatus.BAD_REQUEST, () -> commentService.createComment(video.getId(), null, "subject"));
        for (String content : new String[] {null, "  ", "a".repeat(1001)}) {
            assertStatus(HttpStatus.BAD_REQUEST,
                    () -> commentService.createComment(video.getId(), new CreateCommentRequestDTO(content), "subject"));
        }
        verifyNoInteractions(commentRepository);
    }

    private User authenticatedAuthor() {
        var user = new User("subject", "author@example.com", null, null, null, false);
        user.setId(UUID.randomUUID());
        when(userRepository.findUserByGoogleSubject("subject")).thenReturn(user);
        return user;
    }

    private Comment existingComment() {
        var comment = new Comment();
        comment.setId(UUID.randomUUID());
        comment.setVideo(activeVideo(UUID.randomUUID()));
        comment.setContent("Comment");
        comment.setAuthorDisplayName("Legacy author");
        comment.setImportedLikeCount(5L);
        return comment;
    }

    private void assertStatus(HttpStatus expected, org.junit.jupiter.api.function.Executable action) {
        assertThat(assertThrows(ResponseStatusException.class, action).getStatusCode()).isEqualTo(expected);
    }

    private Video activeVideo(UUID videoId) {
        Video video = new Video();
        video.setId(videoId);
        video.setStatus(VideoStatus.ACTIVE);
        return video;
    }
}
