package com.tecnocampus.LS2.protube_back.services.media;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.util.Locale;
import java.util.UUID;

@Service
public class MediaStorageContext implements MediaStorageStrategy {
    private final MediaStorageStrategy strategy;

    public MediaStorageContext(LocalMediaStorage local, OciMediaClientService oci,
                               @Value("${pro_tube.media.mode:local}") String mode) {
        strategy = switch (mode.strip().toLowerCase(Locale.ROOT)) {
            case "local" -> local;
            case "oci" -> oci;
            default -> throw new IllegalArgumentException("Unknown media storage mode: " + mode);
        };
    }

    public boolean isLocal() {
        return strategy instanceof LocalMediaStorage;
    }

    @Override
    public void upload(UUID id, MultipartFile video, MultipartFile thumbnail) {
        strategy.upload(id, video, thumbnail);
    }

    @Override
    public void delete(UUID id) {
        strategy.delete(id);
    }

    @Override
    public boolean exists(UUID id) {
        return strategy.exists(id);
    }

    @Override
    public String baseUrl() {
        return strategy.baseUrl();
    }

    public String resolveUrl(String url) {
        return url != null && url.startsWith("/media/") ? baseUrl() + url : url;
    }
}
