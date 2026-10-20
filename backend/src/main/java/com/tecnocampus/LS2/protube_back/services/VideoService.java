package com.tecnocampus.LS2.protube_back.services;

import com.google.gson.Gson;
import com.google.gson.JsonParseException;
import com.tecnocampus.LS2.protube_back.model.Category;
import com.tecnocampus.LS2.protube_back.model.dto.MetadataDTO.VideoMetaDTO;
import com.tecnocampus.LS2.protube_back.model.dto.MetadataDTO.VideoMetadataDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.PublicVideoResponseDTO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class VideoService {

    @Value("${pro_tube.store.dir}")
    private String videoSource;

    @Value("${pro_tube.store.source}")
    private String metadataSource;

    private final Gson gson = new Gson();

    public List<PublicVideoResponseDTO> getVideos() {
        List<PublicVideoResponseDTO> videos = new ArrayList<>();
        for (File file : getMetadataFiles()) {
            videos.add(mapToResponse(readMetadata(file)));
        }

        return videos;
    }

    private File[] getMetadataFiles() {
        if (videoSource == null || videoSource.isBlank()) {
            throw new IllegalStateException("Video store directory is not configured");
        }

        File directory = new File(videoSource);
        if (!directory.isDirectory()) {
            throw new IllegalStateException("Video store is not a directory: " + directory.getAbsolutePath());
        }

        File[] files = directory.listFiles(file -> file.isFile() && file.getName().endsWith(".json"));
        if (files == null) {
            throw new IllegalStateException("Could not list video store directory: " + directory.getAbsolutePath());
        }

        return files;
    }

    private VideoMetadataDTO readMetadata(File file) {
        try (Reader reader = Files.newBufferedReader(file.toPath(), StandardCharsets.UTF_8)) {
            VideoMetadataDTO metadata = gson.fromJson(reader, VideoMetadataDTO.class);
            if (metadata == null || metadata.meta() == null) {
                throw new IllegalStateException("Video metadata is empty or missing 'meta': " + file.getAbsolutePath());
            }
            return metadata;
        } catch (IOException e) {
            throw new IllegalStateException("Could not read video metadata file: " + file.getAbsolutePath(), e);
        } catch (JsonParseException e) {
            throw new IllegalStateException("Invalid video metadata JSON: " + file.getAbsolutePath(), e);
        }
    }

    private PublicVideoResponseDTO mapToResponse(VideoMetadataDTO metadata) {
        VideoMetaDTO meta = metadata.meta();

        return new PublicVideoResponseDTO(
                metadata.toPublicId(metadataSource),
                metadata.title(),
                Math.toIntExact(Math.round(metadata.duration())),
                meta.description(),
                "/media/" + metadata.id() + ".webp",
                meta.channel(),
                meta.view_count() == null ? 0L : meta.view_count(),
                meta.like_count(),
                Category.fromMetadataList(meta.categories()),
                Instant.ofEpochSecond(metadata.timestamp()),
                "/media/" + metadata.id() + ".mp4"
        );
    }

    public Optional<PublicVideoResponseDTO> findVideoById(UUID videoId) {
        for (File file : getMetadataFiles()) {
            VideoMetadataDTO metadata = readMetadata(file);
            if (metadata.toPublicId(metadataSource).equals(videoId)) {
                return Optional.of(mapToResponse(metadata));
            }
        }

        return Optional.empty();
    }
}
