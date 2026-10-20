package com.tecnocampus.LS2.protube_back.model.dto.MetadataDTO;

import java.nio.charset.StandardCharsets;
import java.util.UUID;

public record VideoMetadataDTO(
        int id,
        double duration,
        String title,
        String user,
        long timestamp,
        VideoMetaDTO meta

) {
    /**
     * Derives a stable public ID while retaining the numeric ID for media filenames.
     * The source must identify the imported dataset, independently of its folder path.
     */
    public UUID toPublicId(String source) {
        if (source == null || source.isBlank()) {
            throw new IllegalArgumentException("Video metadata source must not be blank");
        }

        String name = "protube:videoGrabber:" + source.strip() + ":" + id;
        return UUID.nameUUIDFromBytes(name.getBytes(StandardCharsets.UTF_8));
    }
}
