package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
@Transactional
class VideoLikeIntegrationTest {
    @MockBean ClientRegistrationRepository registrations;
    @Autowired MockMvc mvc;
    @Autowired UserRepository users;
    @Autowired VideoRepository videos;
    @Autowired EntityManager entityManager;

    @Test
    void persistsOneLikePerUserAndKeepsImportedLikes() throws Exception {
        var owner = saveUser("video-owner");
        saveUser("video-viewer");
        var video = new Video();
        video.setTitle("Video");
        video.setDuration(60);
        video.setThumbnail("cover");
        video.setVideoUrl("/media/video.mp4");
        video.setChannel(owner);
        video.setUploadDate(Instant.now());
        video.setStatus(VideoStatus.ACTIVE);
        video.setLikeCount(5);
        var videoId = videos.saveAndFlush(video).getId();
        var videoUrl = "/api/videos/" + videoId;
        var likeUrl = videoUrl + "/like";
        var likedVideosUrl = "/api/users/me/liked-videos";

        mvc.perform(get(likedVideosUrl)).andExpect(status().is3xxRedirection());
        mvc.perform(put(likeUrl)).andExpect(status().is3xxRedirection());
        mvc.perform(delete(likeUrl)).andExpect(status().is3xxRedirection());
        mvc.perform(get(likeUrl)).andExpect(status().isOk())
                .andExpect(jsonPath("$.likeCount").value(5));

        var viewerSession = session("video-viewer");
        mvc.perform(put(likeUrl).session(viewerSession)).andExpect(status().isOk())
                .andExpect(jsonPath("$.likeCount").value(6));
        mvc.perform(put(likeUrl).session(viewerSession)).andExpect(status().isOk())
                .andExpect(jsonPath("$.likeCount").value(6));

        entityManager.flush();
        entityManager.clear();
        mvc.perform(get(likeUrl).session(session("video-viewer"))).andExpect(status().isOk())
                .andExpect(jsonPath("$.likedByCurrentUser").value(true));
        mvc.perform(get(likeUrl).session(session("video-owner"))).andExpect(status().isOk())
                .andExpect(jsonPath("$.likedByCurrentUser").value(false));
        mvc.perform(get(videoUrl)).andExpect(status().isOk()).andExpect(jsonPath("$.likeCount").value(6));
        mvc.perform(get(likedVideosUrl).session(viewerSession)).andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(1))
                .andExpect(jsonPath("$[0].id").value(videoId.toString()))
                .andExpect(jsonPath("$[0].title").value("Video"));
        mvc.perform(get(likedVideosUrl).session(session("video-owner"))).andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(0));

        var storedVideo = videos.findById(videoId).orElseThrow();
        storedVideo.setStatus(VideoStatus.PENDING);
        mvc.perform(get(likedVideosUrl).session(viewerSession)).andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(0));
        storedVideo.setStatus(VideoStatus.ACTIVE);

        mvc.perform(delete(likeUrl).session(viewerSession)).andExpect(status().isOk())
                .andExpect(jsonPath("$.likedByCurrentUser").value(false))
                .andExpect(jsonPath("$.likeCount").value(5));
        mvc.perform(delete(likeUrl).session(viewerSession)).andExpect(status().isOk())
                .andExpect(jsonPath("$.likeCount").value(5));
        mvc.perform(get(likedVideosUrl).session(viewerSession)).andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(0));
    }

    private User saveUser(String subject) {
        return users.saveAndFlush(new User(subject, subject + "@example.com", subject, null, null, false));
    }

    private MockHttpSession session(String subject) {
        var user = mock(OidcUser.class);
        when(user.getSubject()).thenReturn(subject);
        var authentication = UsernamePasswordAuthenticationToken.authenticated(user, null, List.of());
        var session = new MockHttpSession();
        session.setAttribute(SPRING_SECURITY_CONTEXT_KEY, new SecurityContextImpl(authentication));
        return session;
    }
}
