package com.tecnocampus.LS2.protube_back.configuration;

import com.tecnocampus.LS2.protube_back.services.media.LocalMediaStorage;
import com.tecnocampus.LS2.protube_back.services.media.MediaStorageContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class LocalMediaConfig implements WebMvcConfigurer {
    private final MediaStorageContext media;
    private final LocalMediaStorage local;

    public LocalMediaConfig(MediaStorageContext media, LocalMediaStorage local) {
        this.media = media;
        this.local = local;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if (!media.isLocal()) {
            return;
        }
        String location = local.directory().toUri().toString();
        // Initial videoGrabber files plus new uploads; JSON and staging stay private.
        registry.addResourceHandler("/media/{id:[0-9a-f-]{36}}/video.mp4",
                        "/media/{id:[0-9a-f-]{36}}/thumbnail.webp",
                        "/media/{id:[0-9]+}.mp4", "/media/{id:[0-9]+}.webp")
                .addResourceLocations(location.endsWith("/") ? location : location + "/");
    }
}
