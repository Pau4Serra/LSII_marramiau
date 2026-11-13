
package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.*;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.PublicVideoResponseDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;

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
    private final OciMediaClientService ociMediaClientService;

    public VideoService(
            VideoRepository videoRepository,
            UserRepository userRepository,
            OciMediaClientService ociMediaClientService) {

        this.videoRepository = videoRepository;
        this.userRepository = userRepository;
        this.ociMediaClientService = ociMediaClientService;
    }

    // UPLOAD VIDEO

    @Transactional
    public PublicVideoResponseDTO uploadVideo(
            CreateVideoRequestDTO request,
            MultipartFile file,
            OidcUser principal) {

        User user = userRepository.findUserByGoogleSubject(
                principal.getSubject()
        );

        if (user == null) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "User not found");
        }

        // Upload to OCI
        OciMediaClientService.UploadResponse uploaded =
                ociMediaClientService.upload(
                        file,
                        principal.getIdToken().getTokenValue()
                );

        // Build Video entity and save to database
        Video video = new Video();

        video.setTitle(request.title());
        video.setDescription(request.meta().description());
        video.setDuration(request.duration());
        video.setThumbnail(request.thumbnail());

        video.setCategories(
                Category.fromMetadataList(
                        request.meta().categories()
                )
        );

        video.setChannel(user);
        video.setVideoUrl(uploaded.url());
        video.setStatus(VideoStatus.ACTIVE);
        video.setUploadDate(Instant.now());
        video.setViewCount(0L);
        video.setLikeCount(0);

        // Save to active videos database
        Video saved = videoRepository.save(video);

        return mapToResponse(saved);
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
                video.getThumbnail(),
                video.getChannel().getName(),
                video.getViewCount(),
                video.getLikeCount(),
                video.getCategories(),
                video.getUploadDate(),
                video.getVideoUrl()
        );
    }
}
