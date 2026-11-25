
package com.tecnocampus.LS2.protube_back.persistance;

import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
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

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("select v from Video v where v.id = :id and v.status = :status")
    Optional<Video> findActiveVideoForLike(UUID id, VideoStatus status);

    @Query("""
            select v from VideoLike liked
            join liked.video v
            where liked.user.googleSubject = :subject and v.status = :status
            order by v.uploadDate desc, v.id
            """)
    List<Video> findLikedVideosByGoogleSubject(String subject, VideoStatus status);
}
