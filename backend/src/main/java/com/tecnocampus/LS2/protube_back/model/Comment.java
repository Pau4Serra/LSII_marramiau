package com.tecnocampus.LS2.protube_back.model;

import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentAuthorResponseDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentResponseDTO;
import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "video_id", nullable = false)
    private Video video;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    private User author;

    @Column(name = "author_display_name", nullable = false)
    private String authorDisplayName;

    @Column(nullable = false, columnDefinition = "text")
    private String content;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    private Comment parent;

    @OneToMany(mappedBy = "parent", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("createdAt ASC")
    private List<Comment> replies = new ArrayList<>();

    @OneToMany(mappedBy = "comment", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CommentLike> likes = new ArrayList<>();

    @Column(nullable = false, updatable = false)
    private Instant createdAt;

    @Column(nullable = false)
    private long importedLikeCount = 0L;

    @PrePersist
    protected void onCreate() {
        if (createdAt == null) {
            createdAt = Instant.now();
        }
    }

    public CommentResponseDTO toDTO(
            Map<UUID, Long> localLikeCounts,
            Set<UUID> likedCommentIds) {

        CommentAuthorResponseDTO authorResponse = author != null
                ? author.toDTO()
                : new CommentAuthorResponseDTO(
                        null,
                        authorDisplayName,
                        null
                );

        return new CommentResponseDTO(
                id,
                authorResponse,
                content,
                createdAt,
                importedLikeCount + localLikeCounts.getOrDefault(id, 0L),
                likedCommentIds.contains(id),
                replies.stream()
                        .map(reply -> reply.toDTO(localLikeCounts, likedCommentIds))
                        .toList()
        );
    }
}
