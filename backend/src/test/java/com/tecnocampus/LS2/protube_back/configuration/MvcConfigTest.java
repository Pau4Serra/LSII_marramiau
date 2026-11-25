package com.tecnocampus.LS2.protube_back.configuration;

import com.tecnocampus.LS2.protube_back.security.GoogleLoginSuccessHandler;
import com.tecnocampus.LS2.protube_back.security.SecurityConfig;
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
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

import java.nio.file.Files;
import java.nio.file.Path;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringJUnitWebConfig(MvcConfigTest.TestConfig.class)
@ActiveProfiles("dev")
class MvcConfigTest {
    @TempDir
    static Path directory;

    @Autowired
    private WebApplicationContext context;

    @Autowired
    private Filter springSecurityFilterChain;

    private MockMvc mvc;

    @DynamicPropertySource
    static void properties(DynamicPropertyRegistry registry) {
        registry.add("pro_tube.store.dir", () -> directory.resolve("catalog with spaces").toString());
    }

    @BeforeEach
    void setUp() throws Exception {
        Path catalog = Files.createDirectories(directory.resolve("catalog with spaces"));
        Files.write(catalog.resolve("sample.mp4"), new byte[]{0, 1, 2, 3, 4, 5});
        Files.write(catalog.resolve("sample.webp"), new byte[]{6, 7, 8});
        Files.writeString(catalog.resolve("sample.json"), "{\"private\":true}");
        Files.write(directory.resolve("outside.mp4"), new byte[]{9});
        mvc = MockMvcBuilders.webAppContextSetup(context)
                .addFilters(springSecurityFilterChain).build();
    }

    @Test
    void doesNotRegisterLocalStorageWhenDirectoryIsBlank() {
        ResourceHandlerRegistry registry = mock(ResourceHandlerRegistry.class);
        new MvcConfig(" ").addResourceHandlers(registry);
        verifyNoInteractions(registry);
    }

    @Test
    void servesVideoWithoutLogin() throws Exception {
        mvc.perform(get("/media/sample.mp4"))
                .andExpect(status().isOk())
                .andExpect(content().contentType("video/mp4"))
                .andExpect(header().string("Accept-Ranges", "bytes"))
                .andExpect(content().bytes(new byte[]{0, 1, 2, 3, 4, 5}));
    }

    @Test
    void supportsSeekingAndCors() throws Exception {
        mvc.perform(get("/media/sample.mp4").header("Range", "bytes=2-4")
                        .header("Origin", "http://localhost:5173"))
                .andExpect(status().isPartialContent())
                .andExpect(header().string("Content-Range", "bytes 2-4/6"))
                .andExpect(header().string("Access-Control-Allow-Origin", "http://localhost:5173"))
                .andExpect(content().bytes(new byte[]{2, 3, 4}));
    }

    @Test
    void servesThumbnailAndHeadWithoutLogin() throws Exception {
        mvc.perform(get("/media/sample.webp"))
                .andExpect(status().isOk())
                .andExpect(content().bytes(new byte[]{6, 7, 8}));
        mvc.perform(head("/media/sample.mp4"))
                .andExpect(status().isOk())
                .andExpect(header().longValue("Content-Length", 6))
                .andExpect(content().string(""));
    }

    @Test
    void doesNotExposeMetadataOrFilesOutsideCatalog() throws Exception {
        mvc.perform(get("/media/sample.json")).andExpect(status().isNotFound());
        mvc.perform(get("/media/../outside.mp4")).andExpect(status().isBadRequest());
        mvc.perform(get("/media/missing.mp4")).andExpect(status().isNotFound());
    }

    @Test
    void supportsPreflight() throws Exception {
        mvc.perform(options("/media/sample.mp4")
                        .header("Origin", "http://localhost:5173")
                        .header("Access-Control-Request-Method", "GET")
                        .header("Access-Control-Request-Headers", "Range"))
                .andExpect(status().isOk())
                .andExpect(header().string("Access-Control-Allow-Origin", "http://localhost:5173"));
    }

    @Configuration
    @EnableWebMvc
    @Import({MvcConfig.class, SecurityConfig.class})
    static class TestConfig {
        @Bean
        ClientRegistrationRepository clientRegistrationRepository() {
            return mock(ClientRegistrationRepository.class);
        }

        @Bean
        GoogleLoginSuccessHandler googleLoginSuccessHandler() {
            return mock(GoogleLoginSuccessHandler.class);
        }
    }
}
