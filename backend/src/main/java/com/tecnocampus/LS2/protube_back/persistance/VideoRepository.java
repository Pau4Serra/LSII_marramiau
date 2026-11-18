
package com.tecnocampus.LS2.protube_back.persistance;

import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface VideoRepository extends JpaRepository<Video, UUID> {

    List<Video> findByStatus(VideoStatus status);

    List<Video> findByTitleContainingIgnoreCaseAndStatus(
            String title, VideoStatus status);

    Optional<Video> findByIdAndStatus(
            UUID id, VideoStatus status);

    Optional<Video> findByIdAndChannel_GoogleSubject(
            UUID id, String googleSubject);
}
