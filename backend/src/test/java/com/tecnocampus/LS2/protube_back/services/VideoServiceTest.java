
package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;

import org.junit.jupiter.api.Test;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;

@ExtendWith(MockitoExtension.class)
class VideoServiceTest {

    @Mock
    VideoRepository videoRepository;
    VideoService videoService = new VideoService(videoRepository);


    @Test
    void shouldGoToFolderVideos() {
        assertEquals(List.of("video1", "video2"), videoService.getVideos());
    }

        assertTrue(videoService.getVideos().isEmpty());
    }
}
