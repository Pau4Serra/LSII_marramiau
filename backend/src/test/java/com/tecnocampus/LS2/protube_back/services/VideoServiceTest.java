
package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

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

    @InjectMocks
    VideoService videoService;

    @Test
    void getVideosReturnsEmptyWhenNoActiveVideos() {

        when(videoRepository.findByStatus(VideoStatus.ACTIVE))
                .thenReturn(List.of());

        assertTrue(videoService.getVideos().isEmpty());
    }
}
