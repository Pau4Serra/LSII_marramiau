package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
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
    void searchAndUploadEndpointsReturnExpectedResponses() {
        when(videoService.findVideosByName("test")).thenReturn(List.of());
        assertEquals(List.of(), videosController.getVideosByName("test").getBody());

        var metadata = new CreateVideoRequestDTO("Test", 25, "thumbnail", null);
        var file = new MockMultipartFile("file", new byte[] {1});
        var user = mock(OidcUser.class);
        assertEquals(HttpStatus.CREATED, videosController.uploadVideo(metadata, file, user).getStatusCode());
        verify(videoService).uploadVideo(metadata, file, user);
    }
}
