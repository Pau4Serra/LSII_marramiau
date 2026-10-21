package com.tecnocampus.LS2.protube_back.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Video {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(nullable = false)
    private String title;

    private String description;

    @Column(nullable = false)
    private Integer duration;

    @Column(nullable = false)
    private String thumbnail;

    @Column(nullable = false)
    private String videoUrl;

    @ElementCollection
    @CollectionTable(
            name = "video_categories",
            joinColumns = @JoinColumn(name = "video_id")
    )
    @Enumerated(EnumType.STRING)
    @Column(name = "category", nullable = false)
    private List<Category> categories = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "channel_id", nullable = false)
    private User channel;

    @Column(nullable = false)
    private Long viewCount = 0L;

    @Column(nullable = false)
    private Integer likeCount = 0;

    @ManyToMany
    @JoinTable(
            name = "video_tags",
            joinColumns = @JoinColumn(name = "video_id"),
            inverseJoinColumns = @JoinColumn(name = "tag_id")
    )
    private List<Tag> tags = new ArrayList<>();

    @OneToMany(
            mappedBy = "video",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<Comment> comments = new ArrayList<>();

    @Column(nullable = false, updatable = false)
    private Instant uploadDate;

    private Instant removedDate;
}