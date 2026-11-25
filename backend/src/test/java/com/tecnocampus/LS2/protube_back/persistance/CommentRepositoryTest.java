package com.tecnocampus.LS2.protube_back.persistance;

import com.tecnocampus.LS2.protube_back.model.Comment;
import com.tecnocampus.LS2.protube_back.model.CommentLike;
import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;

import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest(showSql = false)
@ActiveProfiles("dev")
class CommentRepositoryTest {

    @Autowired
    private CommentRepository comments;

    @Autowired
    private org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager entityManager;

    @Autowired
    private CommentLikeRepository commentLikes;

    @Autowired
    private UserRepository users;

    @Autowired
    private VideoRepository videos;

    @Test
    void findsOnlyRootCommentsInReverseChronologicalOrderWithReplies() {
        Video video = saveVideo();
        Comment older = saveComment(video, "Older", Instant.parse("2026-01-01T00:00:00Z"));
        Comment newer = saveComment(video, "Newer", Instant.parse("2026-01-02T00:00:00Z"));
        Comment reply = saveComment(video, "Reply", Instant.parse("2026-01-03T00:00:00Z"));
        reply.setParent(newer);
        comments.saveAndFlush(reply);
        entityManager.clear();

        List<Comment> roots = comments.findByVideo_IdAndParentIsNullOrderByCreatedAtDesc(video.getId());

        assertThat(roots).extracting(Comment::getContent).containsExactly("Newer", "Older");
        assertThat(roots.getFirst().getReplies()).extracting(Comment::getContent).containsExactly("Reply");
    }

    @Test
    void fetchesACommentWithItsVideoAndAuthor() {
        User author = users.saveAndFlush(new User(
                "author-subject", "author@example.com", "Author", null, null, false));
        Video video = saveVideo();
        Comment comment = saveComment(video, "Local comment", Instant.parse("2026-01-01T00:00:00Z"));
        comment.setAuthor(author);
        comments.saveAndFlush(comment);

        Comment detailed = comments.findDetailedById(comment.getId()).orElseThrow();

        assertThat(detailed.getVideo().getId()).isEqualTo(video.getId());
        assertThat(detailed.getAuthor().getId()).isEqualTo(author.getId());
    }

    @Test
    void findsCountsAndCurrentUsersLikesInBulk() {
        User firstUser = users.saveAndFlush(new User(
                "first-subject", "first@example.com", "First", null, null, false));
        User secondUser = users.saveAndFlush(new User(
                "second-subject", "second@example.com", "Second", null, null, false));
        Video video = saveVideo();
        Comment firstComment = saveComment(video, "First", Instant.parse("2026-01-01T00:00:00Z"));
        Comment secondComment = saveComment(video, "Second", Instant.parse("2026-01-02T00:00:00Z"));
        commentLikes.saveAllAndFlush(List.of(
                like(firstComment, firstUser),
                like(firstComment, secondUser),
                like(secondComment, secondUser)));

        Map<UUID, Long> counts = commentLikes.countLikesByCommentIdIn(
                        List.of(firstComment.getId(), secondComment.getId()))
                .stream()
                .collect(Collectors.toMap(
                        CommentLikeRepository.CommentLikeCount::getCommentId,
                        CommentLikeRepository.CommentLikeCount::getLikeCount));
        List<UUID> likedByFirstUser = commentLikes.findCommentIdsLikedByUser(
                List.of(firstComment.getId(), secondComment.getId()), firstUser.getId());

        assertThat(counts).containsEntry(firstComment.getId(), 2L)
                .containsEntry(secondComment.getId(), 1L);
        assertThat(likedByFirstUser).containsExactly(firstComment.getId());
        assertThat(commentLikes.deleteByComment_IdAndUser_Id(firstComment.getId(), firstUser.getId()))
                .isEqualTo(1L);
        assertThat(commentLikes.findByComment_IdAndUser_Id(firstComment.getId(), firstUser.getId()))
                .isEmpty();
    }

    private Video saveVideo() {
        User channel = users.saveAndFlush(new User(
                "channel-" + UUID.randomUUID(),
                "channel" + UUID.randomUUID() + "@example.com",
                "Channel", null, null, false));
        Video video = new Video();
        video.setTitle("Video");
        video.setDuration(60);
        video.setThumbnail("thumbnail.jpg");
        video.setStatus(VideoStatus.ACTIVE);
        video.setChannel(channel);
        video.setUploadDate(Instant.parse("2026-01-01T00:00:00Z"));
        video.setViewCount(0L);
        video.setLikeCount(0);
        return videos.saveAndFlush(video);
    }

    private Comment saveComment(Video video, String content, Instant createdAt) {
        Comment comment = new Comment();
        comment.setVideo(video);
        comment.setAuthorDisplayName("Legacy author");
        comment.setContent(content);
        comment.setCreatedAt(createdAt);
        return comments.saveAndFlush(comment);
    }

    private CommentLike like(Comment comment, User user) {
        CommentLike like = new CommentLike();
        like.setComment(comment);
        like.setUser(user);
        return like;
    }
}
