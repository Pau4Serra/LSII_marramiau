package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoLike;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.VideoLikeResponseDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoLikeRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.UUID;

@Service
public class VideoLikeService {
    private final VideoRepository videos;
    private final UserRepository users;
    private final VideoLikeRepository likes;

    public VideoLikeService(VideoRepository videos, UserRepository users, VideoLikeRepository likes) {
        this.videos = videos;
        this.users = users;
        this.likes = likes;
    }

    @Transactional(readOnly = true)
    public VideoLikeResponseDTO get(UUID videoId, String subject) {
        var video = videos.findByIdAndStatus(videoId, VideoStatus.ACTIVE)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Video not found"));
        User user = subject == null ? null : users.findUserByGoogleSubject(subject);
        boolean liked = user != null && likes.findByVideo_IdAndUser_Id(videoId, user.getId()).isPresent();
        return new VideoLikeResponseDTO(video.getLikeCount(), liked);
    }

    @Transactional
    public VideoLikeResponseDTO set(UUID videoId, String subject, boolean liked) {
        if (subject == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        User user = users.findUserByGoogleSubject(subject);
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found");
        }

        // Serialize like changes and counter updates for this video.
        Video video = videos.findActiveVideoForUpdate(videoId, VideoStatus.ACTIVE)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Video not found"));
        var existing = likes.findByVideo_IdAndUser_Id(videoId, user.getId());
        if (existing.isPresent() == liked) {
            return new VideoLikeResponseDTO(video.getLikeCount(), liked);
        }

        if (liked) {
            var row = new VideoLike();
            row.setUser(user);
            row.setVideo(video);
            likes.save(row);
        } else {
            likes.delete(existing.orElseThrow());
        }

        video.setLikeCount(video.getLikeCount() + (liked ? 1 : -1));
        return new VideoLikeResponseDTO(video.getLikeCount(), liked);
    }
}
