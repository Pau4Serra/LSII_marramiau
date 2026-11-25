package com.tecnocampus.LS2.protube_back.persistance;

import com.tecnocampus.LS2.protube_back.model.VideoLike;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface VideoLikeRepository extends JpaRepository<VideoLike, UUID> {
    Optional<VideoLike> findByVideo_IdAndUser_Id(UUID videoId, UUID userId);
}
