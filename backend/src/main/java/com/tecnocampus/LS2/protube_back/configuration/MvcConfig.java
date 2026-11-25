package com.tecnocampus.LS2.protube_back.configuration;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;

@Configuration
@Profile("dev & !prod")
public class MvcConfig implements WebMvcConfigurer {

    private final String directory;

    public MvcConfig(@Value("${pro_tube.store.dir:}") String directory) {
        this.directory = directory;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if (directory.isBlank()) {
            return;
        }

        String location = Path.of(directory).toAbsolutePath().normalize().toUri().toString();
        if (!location.endsWith("/")) {
            location += "/";
        }

        // Only expose media files, not the JSON metadata alongside them.
        registry.addResourceHandler("/media/*.mp4", "/media/*.webp")
                .addResourceLocations(location);
    }
}
