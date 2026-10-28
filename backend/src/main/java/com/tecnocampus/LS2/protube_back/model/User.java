package com.tecnocampus.LS2.protube_back.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "google_subject", nullable = false, updatable = false)
    private String googleSubject;

    @Column(nullable = false)
    private String email;

    @Column(name = "name")
    private String name;

    @Column(name = "lastname")
    private String lastname;

    @Column(name = "picture_url", length = 2048)
    private String pictureUrl;

    @Column(name = "created_at", nullable = false, updatable = false)
    private Instant createdAt;

    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    @Column(name = "removed_at")
    private Instant removedAt;

    @OneToMany(mappedBy = "channel")
    private List<Video> videos = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        Instant now = Instant.now();
        createdAt = now;
        updatedAt = now;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = Instant.now();
    }

    public User() {

    }

    public User(String googleSubject, String email, String name, String lastName, String pictureUrl) {
        this.googleSubject = googleSubject;
        this.email = email;
        this.name = name;
        this.lastname = lastName;
        this.pictureUrl = pictureUrl;
    }
}