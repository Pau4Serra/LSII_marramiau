package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.io.TempDir;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.util.ReflectionTestUtils;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@ExtendWith(MockitoExtension.class)
class VideoServiceTest {

    @Mock
    VideoRepository videoRepository;

    @Test
    void getVideosReturnsEmptyWhenNoMetadataFiles(@TempDir Path storeDirectory) {
        VideoService videoService = new VideoService(videoRepository);
        ReflectionTestUtils.setField(videoService, "videoSource", storeDirectory.toString());
        ReflectionTestUtils.setField(videoService, "metadataSource", "test-catalog");

        assertTrue(Files.isDirectory(storeDirectory));
        assertEquals(List.of(), videoService.getVideos());
    }

}