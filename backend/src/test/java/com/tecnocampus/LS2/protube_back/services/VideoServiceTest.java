package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.io.TempDir;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(MockitoExtension.class)
class VideoServiceTest {

    @Mock
    VideoRepository videoRepository;

    @Test
    void videoStatusValuesAreAvailable() {
        assertEquals(2, VideoStatus.values().length);
        assertEquals(VideoStatus.ACTIVE, VideoStatus.valueOf("ACTIVE"));
    }

    @Test
    void getVideosReturnsEmptyWhenNoMetadataFiles(@TempDir Path storeDirectory) {
        VideoService videoService = createService(storeDirectory);

        assertTrue(Files.isDirectory(storeDirectory));
        assertEquals(List.of(), videoService.getVideos());
    }

    @Test
    void mapsMetadataAndSupportsSearchAndLookup(@TempDir Path storeDirectory) throws Exception {
        Files.writeString(storeDirectory.resolve("1.json"), metadataJson(1, "First video", "First description"), StandardCharsets.UTF_8);
        Files.writeString(storeDirectory.resolve("2.json"), metadataJson(2, "Second video", "Second description"), StandardCharsets.UTF_8);
        VideoService videoService = createService(storeDirectory);

        assertEquals(2, videoService.getVideos().size());
        assertEquals(1, videoService.findVideosByName("First").size());
        assertEquals(2, videoService.findVideosByName("  ").size());

        UUID firstId = videoService.getVideos().get(0).id();
        assertTrue(videoService.findVideoById(firstId).isPresent());
        assertTrue(videoService.findVideoById(UUID.randomUUID()).isEmpty());
    }

    private VideoService createService(Path storeDirectory) {
        VideoService videoService = new VideoService(videoRepository);
        ReflectionTestUtils.setField(videoService, "videoSource", storeDirectory.toString());
        ReflectionTestUtils.setField(videoService, "metadataSource", "test-catalog");
        return videoService;
    }

    private String metadataJson(int id, String title, String description) {
        return """
                {
                  "id": %d,
                  "duration": 125.4,
                  "title": "%s",
                  "user": "test-user",
                  "timestamp": 1700000000,
                  "meta": {
                    "description": "%s",
                    "categories": ["Music"],
                    "tags": ["tag"],
                    "view_count": 42,
                    "like_count": 7,
                    "channel": "Test Channel",
                    "channel_follower_count": 100
                  }
                }
                """.formatted(id, title, description);
    }

}