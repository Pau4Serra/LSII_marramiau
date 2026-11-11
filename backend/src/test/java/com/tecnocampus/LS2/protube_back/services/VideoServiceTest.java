package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class VideoServiceTest {

    VideoRepository videoRepository;
    VideoService videoService = new VideoService(videoRepository);


    @Test
    void shouldGoToFolderVideos() {
        assertEquals(List.of("video1", "video2"), videoService.getVideos());
    }

}