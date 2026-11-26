package com.tecnocampus.LS2.protube_back.services.media;

import org.springframework.web.multipart.MultipartFile;
import java.util.UUID;

public interface MediaStorageStrategy {
    void upload(UUID id, MultipartFile video, MultipartFile thumbnail);
    void delete(UUID id);
    boolean exists(UUID id);
    String baseUrl();

    default String videoUrl(UUID id) {
        return baseUrl() + "/media/" + id + "/video.mp4";
    }

    default String thumbnailUrl(UUID id) {
        return baseUrl() + "/media/" + id + "/thumbnail.webp";
    }
}
