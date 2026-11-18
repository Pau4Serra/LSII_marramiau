package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.Category;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.VideoMetadataRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.PublicVideoResponseDTO;
import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.multipart.MultipartFile;

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class VideosControllerTest {

    @InjectMocks
    VideosController videosController;

    @Mock
    VideoService videoService;

    @Test
    void getVideosReturnsServiceResponse() {
        when(videoService.getVideos()).thenReturn(List.of());
        assertTrue(videosController.getVideos().getBody().isEmpty());
    }

    @Test
    void getVideoUsesRequestedId() {
        UUID id = UUID.randomUUID();
        when(videoService.findVideoById(id)).thenReturn(Optional.empty());
        assertTrue(videosController.getVideo(id).getBody() == null);
    }

    @Test
    void searchEndpointReturnsServiceResponse() {
        when(videoService.findVideosByName("test")).thenReturn(List.of());
        assertEquals(List.of(), videosController.getVideosByName("test").getBody());
    }

    @Test
    void uploadEndpointReturnsCreatedVideo() {
        CreateVideoRequestDTO metadata = new CreateVideoRequestDTO(
                "Test",
                120,
                "/thumbnail.webp",
                new VideoMetadataRequestDTO("Description", List.of("Music"), List.of(), 0L, 0, "Channel", 0));
        MultipartFile file = org.mockito.Mockito.mock(MultipartFile.class);
        OidcUser user = org.mockito.Mockito.mock(OidcUser.class);
        UUID id = UUID.randomUUID();
        PublicVideoResponseDTO response = new PublicVideoResponseDTO(
                id, "Test", 120, "Description", "/thumbnail.webp", "Channel",
                0L, 0, List.of(Category.MUSIC), Instant.EPOCH, "/video.mp4");
        when(videoService.uploadVideo(metadata, file, user)).thenReturn(response);

        var result = videosController.uploadVideo(metadata, file, user);

        assertEquals(201, result.getStatusCode().value());
        assertEquals(response, result.getBody());
    }
}