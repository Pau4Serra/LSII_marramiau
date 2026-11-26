package com.tecnocampus.LS2.protube_back.configuration;

import com.tecnocampus.LS2.protube_back.security.GoogleLoginSuccessHandler;
import com.tecnocampus.LS2.protube_back.security.SecurityConfig;
import com.tecnocampus.LS2.protube_back.services.media.OciMediaClientService;
import com.tecnocampus.LS2.protube_back.services.media.LocalMediaStorage;
import com.tecnocampus.LS2.protube_back.services.media.MediaStorageContext;
import jakarta.servlet.Filter;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringJUnitWebConfig(LocalMediaConfigTest.TestConfig.class)
@ActiveProfiles("dev")
class LocalMediaConfigTest {
    @TempDir static Path root;
    private static final UUID ID = UUID.randomUUID();
    @Autowired WebApplicationContext context;
    @Autowired Filter springSecurityFilterChain;
    private MockMvc mvc;

    @BeforeEach
    void setUp() throws Exception {
        Path target = Files.createDirectories(root.resolve("media").resolve(ID.toString()));
        Files.write(target.resolve("video.mp4"), new byte[]{0, 1, 2, 3, 4, 5});
        Files.write(target.resolve("thumbnail.webp"), new byte[]{6, 7, 8});
        Files.writeString(target.resolve("metadata.json"), "private");
        Files.write(target.resolve("other.mp4"), new byte[]{9});
        Path staging = Files.createDirectories(root.resolve("media/.upload-test"));
        Files.write(staging.resolve("video.mp4"), new byte[]{9});
        Path invalid = Files.createDirectories(root.resolve("media/not-an-id"));
        Files.write(invalid.resolve("video.mp4"), new byte[]{9});
        mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
    }

    @Test
    void servesPairWithRangeCorsAndHeadWithoutLogin() throws Exception {
        mvc.perform(get("/media/" + ID + "/video.mp4"))
                .andExpect(status().isOk()).andExpect(content().contentType("video/mp4"));
        mvc.perform(get("/media/" + ID + "/thumbnail.webp"))
                .andExpect(status().isOk()).andExpect(content().contentType("image/webp"));
        mvc.perform(get("/media/" + ID + "/video.mp4").header("Range", "bytes=2-4")
                        .header("Origin", "http://localhost:5173"))
                .andExpect(status().isPartialContent())
                .andExpect(header().string("Content-Range", "bytes 2-4/6"))
                .andExpect(header().string("Access-Control-Allow-Origin", "http://localhost:5173"))
                .andExpect(content().bytes(new byte[]{2, 3, 4}));
        mvc.perform(head("/media/" + ID + "/video.mp4"))
                .andExpect(status().isOk()).andExpect(content().string(""));
    }

    @Test
    void doesNotExposeStagingMetadataOtherNamesOrMissingFiles() throws Exception {
        for (String path : new String[]{ID + "/metadata.json", ID + "/other.mp4", ".upload-test/video.mp4",
                "not-an-id/video.mp4", "video.mp4", UUID.randomUUID() + "/video.mp4"}) {
            mvc.perform(get("/media/" + path)).andExpect(status().isNotFound());
        }
    }

    @Test
    void doesNotRegisterAnyHandlerInOciMode() {
        var media = mock(MediaStorageContext.class);
        var registry = mock(ResourceHandlerRegistry.class);
        new LocalMediaConfig(media, mock(LocalMediaStorage.class)).addResourceHandlers(registry);
        verifyNoInteractions(registry);
    }

    @Test
    void protectsAnonymousWritesButAllowsPublicCommentReads() throws Exception {
        mvc.perform(delete("/api/videos/" + ID)).andExpect(status().is3xxRedirection());
        mvc.perform(post("/api/videos/upload")).andExpect(status().is3xxRedirection());
        mvc.perform(get("/api/videos/" + ID + "/comments")).andExpect(status().isNotFound());
    }

    @Configuration
    @EnableWebMvc
    @Import({LocalMediaConfig.class, SecurityConfig.class})
    static class TestConfig {
        @Bean LocalMediaStorage localMediaStorage() {
            return new LocalMediaStorage(root.resolve("media").toString(), "http://localhost:8080");
        }
        @Bean MediaStorageContext mediaStorageContext(LocalMediaStorage local) {
            return new MediaStorageContext(local, mock(OciMediaClientService.class), "local");
        }
        @Bean ClientRegistrationRepository clientRegistrationRepository() {
            return mock(ClientRegistrationRepository.class);
        }
        @Bean GoogleLoginSuccessHandler googleLoginSuccessHandler() {
            return mock(GoogleLoginSuccessHandler.class);
        }
    }
}
