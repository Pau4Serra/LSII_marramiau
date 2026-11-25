package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.VideoMetadataRequestDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.server.ResponseStatusException;

import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class VideoServiceTest {
    @Mock VideoRepository videos;
    @Mock UserRepository users;
    @Mock OciMediaClientService media;
    @InjectMocks VideoService service;

    @Test
    void listsSearchesAndFindsActiveVideos() {
        var video = new Video();
        video.setId(UUID.randomUUID());
        video.setTitle("First video");
        video.setDuration(125);
        var channel = new User();
        channel.setName("Channel");
        video.setChannel(channel);

        when(videos.findByStatus(VideoStatus.ACTIVE)).thenReturn(List.of(video));
        when(videos.findByTitleContainingIgnoreCaseAndStatus("First", VideoStatus.ACTIVE)).thenReturn(List.of(video));
        when(videos.findByIdAndStatus(video.getId(), VideoStatus.ACTIVE)).thenReturn(Optional.of(video));

        var response = service.getVideos().getFirst();
        assertEquals("First video", response.title());
        assertEquals("Channel", response.channelName());
        assertEquals(List.of(response), service.findVideosByName(" First "));
        assertEquals(List.of(response), service.findVideosByName(" "));
        assertEquals(Optional.of(response), service.findVideoById(video.getId()));
        assertTrue(service.findVideoById(UUID.randomUUID()).isEmpty());
    }

    @Test
    void uploadsAndPersistsVideoForKnownUser() {
        var principal = mock(OidcUser.class);
        var now = Instant.now();
        when(principal.getSubject()).thenReturn("subject");
        when(principal.getIdToken()).thenReturn(new OidcIdToken("token", now, now.plusSeconds(60), Map.of("sub", "subject")));
        var channel = new User();
        channel.setName("Channel");
        var file = new MockMultipartFile("file", new byte[] {1});
        var upload = new OciMediaClientService.UploadResponse("id", "https://example.com/video.mp4");
        when(users.findUserByGoogleSubject("subject")).thenReturn(channel);
        when(media.upload(file, "token")).thenReturn(upload);
        when(videos.save(any(Video.class))).thenAnswer(call -> {
            Video video = call.getArgument(0);
            assertSame(channel, video.getChannel());
            assertEquals(VideoStatus.ACTIVE, video.getStatus());
            return video;
        });

        var metadata = new VideoMetadataRequestDTO("Description", List.of(), List.of(), 0L, 0, "", 0);
        var response = service.uploadVideo(new CreateVideoRequestDTO("Video", 25, "cover", metadata), file, principal);
        assertEquals(upload.url(), response.videoUrl());
        assertEquals("Channel", response.channelName());
    }

    @Test
    void rejectsUploadForUnknownUserBeforeSendingMedia() {
        var principal = mock(OidcUser.class);
        when(principal.getSubject()).thenReturn("unknown");
        var request = new CreateVideoRequestDTO("Video", 25, "cover", null);
        var file = new MockMultipartFile("file", new byte[] {1});

        var error = assertThrows(ResponseStatusException.class, () -> service.uploadVideo(request, file, principal));
        assertEquals(HttpStatus.NOT_FOUND, error.getStatusCode());
        verifyNoInteractions(media, videos);
    }
}
