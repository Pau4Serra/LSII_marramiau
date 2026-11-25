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
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;

import java.time.Instant;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class VideoServiceTest {
    @Mock
    VideoRepository videoRepository;

    @Mock
    UserRepository userRepository;

    @Mock
    OciMediaClientService ociMediaClientService;

    @InjectMocks
    VideoService videoService;

    @Test
    void getVideosReturnsEmptyWhenNoVideosAreActive() {
        when(videoRepository.findByStatus(VideoStatus.ACTIVE)).thenReturn(List.of());
        assertEquals(List.of(), videoService.getVideos());
    }

    @Test
    void mapsActiveVideosAndSupportsSearchAndLookup() {
        var channel = new User();
        channel.setName("Test Channel");
        var video = new Video();
        video.setId(UUID.randomUUID());
        video.setTitle("First video");
        video.setDuration(125);
        video.setChannel(channel);

        when(videoRepository.findByStatus(VideoStatus.ACTIVE)).thenReturn(List.of(video));
        when(videoRepository.findByTitleContainingIgnoreCaseAndStatus("First", VideoStatus.ACTIVE))
                .thenReturn(List.of(video));
        when(videoRepository.findByIdAndStatus(video.getId(), VideoStatus.ACTIVE)).thenReturn(Optional.of(video));

        var response = videoService.getVideos().getFirst();
        assertEquals("First video", response.title());
        assertEquals("Test Channel", response.channelName());
        assertEquals(List.of(response), videoService.findVideosByName(" First "));
        assertEquals(List.of(response), videoService.findVideosByName("  "));
        assertEquals(Optional.of(response), videoService.findVideoById(video.getId()));
        assertTrue(videoService.findVideoById(UUID.randomUUID()).isEmpty());
    }

    @Test
    void savesUploadedVideoAndReturnsItsMediaUrl() {
        var principal = mock(OidcUser.class);
        var now = Instant.now();
        var idToken = new OidcIdToken("id-token", now, now.plusSeconds(60), Map.of("sub", "google-subject"));
        when(principal.getSubject()).thenReturn("google-subject");
        when(principal.getIdToken()).thenReturn(idToken);

        var channel = new User();
        channel.setName("Test Channel");
        var file = new MockMultipartFile("file", new byte[] {1});
        var media = new OciMediaClientService.UploadResponse("media-id", "https://example.com/video.mp4");
        when(userRepository.findUserByGoogleSubject("google-subject")).thenReturn(channel);
        when(ociMediaClientService.upload(file, "id-token")).thenReturn(media);
        when(videoRepository.save(any(Video.class))).thenAnswer(invocation -> {
            Video video = invocation.getArgument(0);
            assertEquals(VideoStatus.ACTIVE, video.getStatus());
            assertEquals(channel, video.getChannel());
            return video;
        });

        var metadata = new VideoMetadataRequestDTO("Description", List.of(), List.of(), 0L, 0, "", 0);
        var response = videoService.uploadVideo(new CreateVideoRequestDTO("Video", 25, "thumbnail", metadata),
                file, principal);

        assertEquals(media.url(), response.videoUrl());
        assertEquals(channel.getName(), response.channelName());
    }
}
