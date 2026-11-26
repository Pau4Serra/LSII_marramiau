package com.tecnocampus.LS2.protube_back.services.media;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Component
public class LocalMediaStorage implements MediaStorageStrategy {
    private static final Logger LOG = LoggerFactory.getLogger(LocalMediaStorage.class);
    private static final List<String> FILES = List.of("video.mp4", "thumbnail.webp");
    private final Path directory;
    private final String baseUrl;

    public LocalMediaStorage(@Value("${pro_tube.media.local.directory:./media-store}") String directory,
                             @Value("${pro_tube.media.local.base-url:http://localhost:8080}") String baseUrl) {
        this.directory = Path.of(directory).toAbsolutePath().normalize();
        this.baseUrl = baseUrl.replaceAll("/+$", "");
    }

    public Path directory() {
        return directory;
    }

    @Override
    public String baseUrl() {
        return baseUrl;
    }

    private Path target(UUID id) {
        Path target = directory.resolve(id.toString());
        if (Files.isSymbolicLink(directory) || Files.isSymbolicLink(target)
                || (Files.exists(target) && !Files.isDirectory(target))) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Unsafe local media directory");
        }
        return target;
    }

    @Override
    public synchronized boolean exists(UUID id) {
        Path target = target(id);
        if (!Files.exists(target)) {
            return false;
        }
        if (FILES.stream().anyMatch(name -> !Files.isRegularFile(target.resolve(name), LinkOption.NOFOLLOW_LINKS))) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Incomplete local media pair");
        }
        return true;
    }

    @Override
    public synchronized void upload(UUID id, MultipartFile video, MultipartFile thumbnail) {
        Path target = target(id);
        if (Files.exists(target)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Video already exists");
        }
        Path staging = null;
        try {
            Files.createDirectories(directory);
            // Same filesystem as the destination, but not matched by the public routes.
            staging = Files.createTempDirectory(directory, ".upload-");
            video.transferTo(staging.resolve("video.mp4"));
            thumbnail.transferTo(staging.resolve("thumbnail.webp"));
            Files.move(staging, target, StandardCopyOption.ATOMIC_MOVE);
        } catch (IOException error) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Cannot store local media", error);
        } finally {
            if (staging != null && Files.exists(staging)) {
                try {
                    deleteDirectory(staging);
                } catch (IOException error) {
                    LOG.warn("Could not remove staging directory for video {}", id, error);
                }
            }
        }
    }

    @Override
    public synchronized void delete(UUID id) {
        Path target = target(id);
        if (!Files.exists(target)) {
            return;
        }
        try {
            deleteDirectory(target);
        } catch (IOException error) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "Cannot delete local media", error);
        }
    }

    private void deleteDirectory(Path folder) throws IOException {
        try (var paths = Files.list(folder)) {
            if (paths.anyMatch(path -> !FILES.contains(path.getFileName().toString())
                    || !Files.isRegularFile(path, LinkOption.NOFOLLOW_LINKS))) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "Unexpected local media files");
            }
        }
        for (String name : FILES) {
            Files.deleteIfExists(folder.resolve(name));
        }
        Files.delete(folder);
    }
}
