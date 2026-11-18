package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.Comment;
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

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyCollection;
import static org.mockito.Mockito.verify;
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

    private Video activeVideo(UUID videoId) {
        Video video = new Video();
        video.setId(videoId);
        video.setStatus(VideoStatus.ACTIVE);
        return video;
    }
}
