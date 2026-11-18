package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.Category;
import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class VideoServiceTest {

    @Mock
    VideoRepository videoRepository;

    @Mock
    UserRepository userRepository;

    @Mock
    OciMediaClientService ociMediaClientService;

    VideoService videoService;

    @BeforeEach
    void setUp() {
        videoService = new VideoService(videoRepository, userRepository, ociMediaClientService);
    }

    @Test
    void getVideosReturnsActiveVideos() {
        Video video = activeVideo("First video");
        when(videoRepository.findByStatus(VideoStatus.ACTIVE)).thenReturn(List.of(video));

        var result = videoService.getVideos();

        assertEquals(1, result.size());
        assertEquals("First video", result.get(0).title());
    }

    @Test
    void findVideosByNameUsesTrimmedCaseInsensitiveSearch() {
        Video video = activeVideo("First video");
        when(videoRepository.findByTitleContainingIgnoreCaseAndStatus("First", VideoStatus.ACTIVE))
                .thenReturn(List.of(video));

        assertEquals(1, videoService.findVideosByName("  First  ").size());
    }

    @Test
    void findVideosByNameWithBlankQueryReturnsActiveVideos() {
        when(videoRepository.findByStatus(VideoStatus.ACTIVE)).thenReturn(List.of(activeVideo("First video")));

        assertEquals(1, videoService.findVideosByName("  ").size());
    }

    @Test
    void findVideoByIdReturnsActiveVideoOrEmpty() {
        UUID id = UUID.randomUUID();
        Video video = activeVideo("First video");
        video.setId(id);
        when(videoRepository.findByIdAndStatus(id, VideoStatus.ACTIVE)).thenReturn(Optional.of(video));

        assertTrue(videoService.findVideoById(id).isPresent());

        UUID missingId = UUID.randomUUID();
        when(videoRepository.findByIdAndStatus(missingId, VideoStatus.ACTIVE)).thenReturn(Optional.empty());
        assertTrue(videoService.findVideoById(missingId).isEmpty());
    }

    private Video activeVideo(String title) {
        User channel = new User("subject", "channel@example.com", "Test", "Channel", "picture", false);
        channel.setName("Test Channel");

        Video video = new Video();
        video.setId(UUID.randomUUID());
        video.setTitle(title);
        video.setDescription("Description");
        video.setDuration(125);
        video.setThumbnail("/thumbnail.webp");
        video.setVideoUrl("/video.mp4");
        video.setStatus(VideoStatus.ACTIVE);
        video.setCategories(List.of(Category.MUSIC));
        video.setChannel(channel);
        video.setViewCount(42L);
        video.setLikeCount(7);
        video.setUploadDate(Instant.parse("2023-11-15T00:00:00Z"));
        return video;
    }
}
