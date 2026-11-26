package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.Comment;
import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.persistance.CommentRepository;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
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
class VideoEngagementIntegrationTest {
    @MockBean ClientRegistrationRepository registrations;
    @Autowired MockMvc mvc;
    @Autowired UserRepository users;
    @Autowired VideoRepository videos;
    @Autowired CommentRepository comments;
    @Autowired EntityManager entityManager;

    @Test
    void persistsOneLikePerUserAndKeepsImportedLikes() throws Exception {
        var owner = saveUser("video-owner");
        saveUser("video-viewer");
        var videoId = saveVideo(owner, "Video", VideoStatus.ACTIVE).getId();
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

    @Test
    void returnsOnlyOwnedVideoAnalyticsAndRecordsPlaybackViews() throws Exception {
        var owner = saveUser("analytics-owner");
        var other = saveUser("analytics-other");
        saveUser("analytics-empty");
        var video = saveVideo(owner, "Owned video", VideoStatus.ACTIVE);
        var pending = saveVideo(other, "Other video", VideoStatus.PENDING);
        var comment = new Comment();
        comment.setVideo(video);
        comment.setAuthor(other);
        comment.setAuthorDisplayName(other.getName());
        comment.setContent("Nice video");
        comments.saveAndFlush(comment);

        var analyticsUrl = "/api/users/me/video-analytics";
        var videoUrl = "/api/videos/" + video.getId();
        mvc.perform(get(analyticsUrl)).andExpect(status().is3xxRedirection());
        mvc.perform(post(videoUrl + "/views")).andExpect(status().isNoContent());
        mvc.perform(post(videoUrl + "/views")).andExpect(status().isNoContent());
        mvc.perform(get(videoUrl)).andExpect(status().isOk()).andExpect(jsonPath("$.viewsCount").value(2));
        mvc.perform(post("/api/videos/" + pending.getId() + "/views")).andExpect(status().isNotFound());
        mvc.perform(put(videoUrl + "/like").session(session("analytics-other"))).andExpect(status().isOk());

        mvc.perform(get(analyticsUrl).session(session("analytics-owner")))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(1))
                .andExpect(jsonPath("$[0].id").value(video.getId().toString()))
                .andExpect(jsonPath("$[0].title").value("Owned video"))
                .andExpect(jsonPath("$[0].status").value("ACTIVE"))
                .andExpect(jsonPath("$[0].viewsCount").value(2))
                .andExpect(jsonPath("$[0].likeCount").value(6))
                .andExpect(jsonPath("$[0].commentCount").value(1));
        mvc.perform(get(analyticsUrl).session(session("analytics-other")))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(1))
                .andExpect(jsonPath("$[0].id").value(pending.getId().toString()))
                .andExpect(jsonPath("$[0].viewsCount").value(0))
                .andExpect(jsonPath("$[0].commentCount").value(0));
        mvc.perform(get(analyticsUrl).session(session("analytics-empty")))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(0));
    }

    @Test
    void editsMetadataOnlyForTheOwnerAndReturnsSavedValuesOnTheWatchEndpoint() throws Exception {
        var owner = saveUser("metadata-owner");
        saveUser("metadata-other");
        var video = saveVideo(owner, "Original title", VideoStatus.ACTIVE);
        var videoUrl = "/api/videos/" + video.getId();
        var metadataUrl = videoUrl + "/metadata";
        var changes = """
                {"title":"Updated title","description":"New description","categories":["MUSIC"],"tags":["live"," concert ","live"]}
                """;

        mvc.perform(patch(metadataUrl).contentType(MediaType.APPLICATION_JSON).content(changes))
                .andExpect(status().is3xxRedirection());
        mvc.perform(patch(metadataUrl).session(session("metadata-other"))
                        .contentType(MediaType.APPLICATION_JSON).content(changes))
                .andExpect(status().isForbidden());
        mvc.perform(get(videoUrl)).andExpect(status().isOk())
                .andExpect(jsonPath("$.title").value("Original title"));

        var ownerSession = session("metadata-owner");
        mvc.perform(patch(metadataUrl).session(ownerSession)
                        .contentType(MediaType.APPLICATION_JSON).content("{\"tags\":[\" \"]}"))
                .andExpect(status().isBadRequest());
        mvc.perform(patch(metadataUrl).session(ownerSession)
                        .contentType(MediaType.APPLICATION_JSON).content(changes))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.tags.length()").value(2));

        entityManager.flush();
        entityManager.clear();
        mvc.perform(get(videoUrl)).andExpect(status().isOk())
                .andExpect(jsonPath("$.title").value("Updated title"))
                .andExpect(jsonPath("$.description").value("New description"))
                .andExpect(jsonPath("$.categories[0]").value("MUSIC"))
                .andExpect(jsonPath("$.tags[0]").value("concert"))
                .andExpect(jsonPath("$.tags[1]").value("live"))
                .andExpect(jsonPath("$.likeCount").value(5));
        mvc.perform(patch(metadataUrl).session(ownerSession)
                        .contentType(MediaType.APPLICATION_JSON).content("{\"tags\":[],\"description\":\"\"}"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.tags.length()").value(0))
                .andExpect(jsonPath("$.description").value(""))
                .andExpect(jsonPath("$.title").value("Updated title"))
                .andExpect(jsonPath("$.categories[0]").value("MUSIC"));
    }

    private Video saveVideo(User owner, String title, VideoStatus status) {
        var video = new Video();
        video.setTitle(title);
        video.setDuration(60);
        video.setThumbnail("cover");
        video.setVideoUrl("/media/video.mp4");
        video.setChannel(owner);
        video.setUploadDate(Instant.now());
        video.setStatus(status);
        video.setLikeCount(5);
        return videos.saveAndFlush(video);
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
