
package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.*;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.PublicVideoResponseDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import com.tecnocampus.LS2.protube_back.services.media.MediaStorageContext;

import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class VideoService {

    private final VideoRepository videoRepository;
    private final UserRepository userRepository;
    private final MediaStorageContext media;

    public VideoService(
            VideoRepository videoRepository,
            UserRepository userRepository,
            MediaStorageContext media) {

        this.videoRepository = videoRepository;
        this.userRepository = userRepository;
        this.media = media;
    }

    // UPLOAD VIDEO

    public PublicVideoResponseDTO uploadVideo(
            CreateVideoRequestDTO request,
            MultipartFile file,
            MultipartFile thumbnail,
            OidcUser principal) {
        String subject = requireSubject(principal);
        validateUpload(request, file, thumbnail);
        User user = userRepository.findUserByGoogleSubject(subject);
        if (user == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found");
        }
        Video video = new Video();
        UUID id = video.getId();
        video.setTitle(request.title().strip());
        video.setDescription(request.meta().description());
        video.setDuration(request.duration());
        video.setCategories(Category.fromMetadataList(request.meta().categories()));
        video.setChannel(user);
        video.setVideoUrl(media.videoUrl(id));
        video.setThumbnail(media.thumbnailUrl(id));
        video.setStatus(VideoStatus.ACTIVE);
        video.setUploadDate(Instant.now());
        // Identity and counters come from the server, never from client metadata.
        video.setViewCount(0L);
        video.setLikeCount(0);
        PublicVideoResponseDTO response = mapToResponse(video);

        media.upload(id, file, thumbnail);
        try {
            videoRepository.saveAndFlush(video);
        } catch (RuntimeException error) {
            // The upload succeeded but persistence failed: try to remove this pair only.
            try {
                media.delete(id);
            } catch (RuntimeException cleanupError) {
                error.addSuppressed(cleanupError);
            }
            throw error;
        }
        return response;
    }

    private String requireSubject(OidcUser principal) {
        if (principal == null || principal.getSubject() == null || principal.getSubject().isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Authentication required");
        }
        return principal.getSubject();
    }

    private void validateUpload(CreateVideoRequestDTO request, MultipartFile file, MultipartFile thumbnail) {
        if (request == null || request.title() == null || request.title().isBlank()
                || request.title().strip().length() > 255 || request.duration() == null
                || request.duration() <= 0 || request.meta() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid video metadata");
        }
        validateFile(file, "video/mp4", 100L * 1024 * 1024);
        validateFile(thumbnail, "image/webp", 5L * 1024 * 1024);
    }

    private void validateFile(MultipartFile file, String type, long limit) {
        if (file == null || file.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Both media files are required");
        }
        if (!type.equalsIgnoreCase(file.getContentType())) {
            throw new ResponseStatusException(HttpStatus.UNSUPPORTED_MEDIA_TYPE, "Expected " + type);
        }
        if (file.getSize() > limit) {
            throw new ResponseStatusException(HttpStatus.PAYLOAD_TOO_LARGE, "Media file size limit exceeded");
        }
    }

    public void deleteVideo(UUID id, OidcUser principal) {
        String subject = requireSubject(principal);
        Video video = videoRepository.findByIdAndChannel_GoogleSubject(id, subject).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Video not found"));
        if (video.getStatus() == VideoStatus.PENDING) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Video upload is pending");
        }
        if (!media.videoUrl(id).equals(media.resolveUrl(video.getVideoUrl()))
                || !media.thumbnailUrl(id).equals(media.resolveUrl(video.getThumbnail()))) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Video belongs to another storage location or legacy format");
        }
        if (video.getStatus() != VideoStatus.REMOVED) {
            video.setStatus(VideoStatus.REMOVED);
            video.setRemovedDate(Instant.now());
            videoRepository.saveAndFlush(video);
        }
        // Repository save completes before remote I/O, so the owner can retry a failed DELETE.
        media.delete(id);
    }

    // GET ALL VIDEOS

    @Transactional(readOnly = true)
    public List<PublicVideoResponseDTO> getVideos() {

        return videoRepository
                .findByStatus(VideoStatus.ACTIVE)
                .stream()
                .map(this::mapToResponse)
                .toList();
    }

    // GET VIDEO BY ID

    @Transactional(readOnly = true)
    public Optional<PublicVideoResponseDTO> findVideoById(
            UUID videoId) {

        return videoRepository
                .findByIdAndStatus(
                        videoId, VideoStatus.ACTIVE)
                .map(this::mapToResponse);
    }

    // SEARCH VIDEOS BY TITLE

    @Transactional(readOnly = true)
    public List<PublicVideoResponseDTO> findVideosByName(
            String query) {

        if (query == null || query.isBlank()) {
            return getVideos();
        }

        return videoRepository
                .findByTitleContainingIgnoreCaseAndStatus(
                        query.trim(),
                        VideoStatus.ACTIVE
                )
                .stream()
                .map(this::mapToResponse)
                .toList();
    }

    // ENTITY TO RESPONSE DTO

    private PublicVideoResponseDTO mapToResponse(Video video) {
        return new PublicVideoResponseDTO(
                video.getId(),
                video.getTitle(),
                video.getDuration(),
                video.getDescription(),
                media.resolveUrl(video.getThumbnail()),
                video.getChannel().getName(),
                video.getViewCount(),
                video.getLikeCount(),
                video.getCategories(),
                video.getUploadDate(),
                media.resolveUrl(video.getVideoUrl())
        );
    }
}
