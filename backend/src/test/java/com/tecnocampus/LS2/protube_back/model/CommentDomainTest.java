package com.tecnocampus.LS2.protube_back.model;

import org.junit.jupiter.api.Test;

import java.time.Instant;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

class CommentDomainTest {

    @Test
    void commentInitializesItsCollectionsAndCreationDate() {
        Comment comment = new Comment();

        assertTrue(comment.getReplies().isEmpty());
        assertTrue(comment.getLikes().isEmpty());

        comment.onCreate();

        assertNotNull(comment.getCreatedAt());
    }

    @Test
    void commentPreservesAnExplicitCreationDate() {
        Comment comment = new Comment();
        Instant createdAt = Instant.parse("2026-01-01T00:00:00Z");
        comment.setCreatedAt(createdAt);

        comment.onCreate();

        assertEquals(createdAt, comment.getCreatedAt());
    }

    @Test
    void commentSupportsLegacyAuthorshipWithoutAUserAccount() {
        Comment comment = new Comment();
        comment.setAuthorDisplayName("legacy-viewer");
        comment.setImportedLikeCount(42L);

        assertNull(comment.getAuthor());
        assertEquals("legacy-viewer", comment.getAuthorDisplayName());
        assertEquals(42L, comment.getImportedLikeCount());
    }

    @Test
    void mapsLegacyCommentsAndRepliesToResponseDtos() {
        Comment comment = new Comment();
        UUID commentId = UUID.randomUUID();
        comment.setId(commentId);
        comment.setAuthorDisplayName("legacy-viewer");
        comment.setContent("Legacy comment");
        comment.setCreatedAt(Instant.parse("2026-01-01T00:00:00Z"));
        comment.setImportedLikeCount(42L);

        Comment reply = new Comment();
        UUID replyId = UUID.randomUUID();
        reply.setId(replyId);
        reply.setAuthorDisplayName("another-legacy-viewer");
        reply.setContent("Legacy reply");
        reply.setCreatedAt(Instant.parse("2026-01-01T01:00:00Z"));
        reply.setParent(comment);
        comment.getReplies().add(reply);

        var dto = comment.toDTO(Map.of(commentId, 2L, replyId, 1L), Set.of(replyId));

        assertNull(dto.author().userId());
        assertEquals("legacy-viewer", dto.author().name());
        assertEquals(44L, dto.likeCount());
        assertTrue(!dto.likedByCurrentUser());
        assertEquals(1, dto.replies().size());
        assertEquals("Legacy reply", dto.replies().getFirst().content());
        assertTrue(dto.replies().getFirst().likedByCurrentUser());
    }

    @Test
    void mapsLocalCommentAuthorsToResponseDtos() {
        User author = new User();
        UUID userId = UUID.randomUUID();
        author.setId(userId);
        author.setName("Local author");
        author.setPictureUrl("https://example.com/avatar.png");

        Comment comment = new Comment();
        UUID commentId = UUID.randomUUID();
        comment.setId(commentId);
        comment.setAuthor(author);
        comment.setAuthorDisplayName("Local author");
        comment.setContent("Local comment");
        comment.setCreatedAt(Instant.parse("2026-01-01T00:00:00Z"));

        var dto = comment.toDTO(Map.of(), Set.of(commentId));

        assertEquals(userId, dto.author().userId());
        assertEquals("Local author", dto.author().name());
        assertEquals("https://example.com/avatar.png", dto.author().pictureUrl());
        assertTrue(dto.likedByCurrentUser());
    }

    @Test
    void commentLikeInitializesAndPreservesItsCreationDate() {
        CommentLike commentLike = new CommentLike();

        commentLike.onCreate();

        assertNotNull(commentLike.getCreatedAt());

        Instant createdAt = Instant.parse("2026-01-01T00:00:00Z");
        commentLike.setCreatedAt(createdAt);
        commentLike.onCreate();

        assertEquals(createdAt, commentLike.getCreatedAt());
    }
}
