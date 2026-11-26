package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.services.VideoService;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.ArgumentCaptor;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.web.method.annotation.AuthenticationPrincipalArgumentResolver;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@ExtendWith(MockitoExtension.class)
class VideosControllerTest {

    @AfterEach
    void clearSecurityContext() {
        SecurityContextHolder.clearContext();
    }

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
        var metadata = new com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO("Video", 25, null);
        var file = new org.springframework.mock.web.MockMultipartFile("file", new byte[] {1});
        var thumbnail = new org.springframework.mock.web.MockMultipartFile("thumbnail", new byte[] {2});
        var user = org.mockito.Mockito.mock(org.springframework.security.oauth2.core.oidc.user.OidcUser.class);
        assertEquals(201, videosController.uploadVideo(metadata, file, thumbnail, user).getStatusCode().value());
        org.mockito.Mockito.verify(videoService).uploadVideo(metadata, file, thumbnail, user);
        UUID id = UUID.randomUUID();
        assertEquals(204, videosController.deleteVideo(id, user).getStatusCode().value());
        org.mockito.Mockito.verify(videoService).deleteVideo(id, user);
    }

    @Test
    void deserializesJsonPartAndPassesBothFilesAndTheSessionPrincipal() throws Exception {
        var principal = mock(OidcUser.class);
        SecurityContextHolder.getContext().setAuthentication(new OAuth2AuthenticationToken(principal, List.of(), "google"));
        var mvc = MockMvcBuilders.standaloneSetup(videosController)
                .setCustomArgumentResolvers(new AuthenticationPrincipalArgumentResolver()).build();
        var metadata = new MockMultipartFile("metadata", "", "application/json",
                "{\"title\":\"Video\",\"duration\":1,\"meta\":{\"description\":\"Description\"}}".getBytes());
        var file = new MockMultipartFile("file", "video.mp4", "video/mp4", new byte[]{1});
        var thumbnail = new MockMultipartFile("thumbnail", "thumbnail.webp", "image/webp", new byte[]{2});
        mvc.perform(multipart("/api/videos/upload").file(metadata).file(file).file(thumbnail))
                .andExpect(status().isCreated());
        var request = ArgumentCaptor.forClass(CreateVideoRequestDTO.class);
        verify(videoService).uploadVideo(request.capture(), eq(file), eq(thumbnail), same(principal));
        assertEquals("Video", request.getValue().title());
        assertEquals("Description", request.getValue().meta().description());
    }

    @Test
    void rejectsUntypedMetadataAndMissingThumbnailAtTheHttpBoundary() throws Exception {
        var mvc = MockMvcBuilders.standaloneSetup(videosController)
                .setCustomArgumentResolvers(new AuthenticationPrincipalArgumentResolver()).build();
        var file = new MockMultipartFile("file", "video.mp4", "video/mp4", new byte[]{1});
        var thumbnail = new MockMultipartFile("thumbnail", "thumbnail.webp", "image/webp", new byte[]{2});
        mvc.perform(multipart("/api/videos/upload")
                        .file(new MockMultipartFile("metadata", "", "application/octet-stream", "{}".getBytes()))
                        .file(file).file(thumbnail)).andExpect(status().isUnsupportedMediaType());
        mvc.perform(multipart("/api/videos/upload")
                        .file(new MockMultipartFile("metadata", "", "application/json", "{}".getBytes()))
                        .file(file)).andExpect(status().isBadRequest());
        verifyNoInteractions(videoService);
    }
}
