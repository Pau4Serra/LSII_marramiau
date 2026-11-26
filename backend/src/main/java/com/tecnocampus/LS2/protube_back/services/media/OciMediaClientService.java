package com.tecnocampus.LS2.protube_back.services.media;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.AbstractResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.util.UUID;

@Component
public class OciMediaClientService implements MediaStorageStrategy {
    private final RestClient client;
    private final String baseUrl;
    private final String apiKey;

    @Autowired
    public OciMediaClientService(RestClient.Builder builder,
                                 @Value("${pro_tube.media.base-url}") String baseUrl,
                                 @Value("${pro_tube.media.api-key:}") String apiKey) {
        this(builder.requestFactory(requestFactory()).baseUrl(baseUrl).build(), baseUrl, apiKey);
    }

    OciMediaClientService(RestClient client, String baseUrl, String apiKey) {
        this.client = client;
        this.baseUrl = baseUrl.replaceAll("/+$", "");
        this.apiKey = apiKey;
    }

    private static SimpleClientHttpRequestFactory requestFactory() {
        var factory = new SimpleClientHttpRequestFactory();
        factory.setConnectTimeout(10_000);
        factory.setReadTimeout(600_000);
        return factory;
    }

    public record UploadResponse(UUID id, String videoUrl, String thumbnailUrl) {}

    @Override
    public String baseUrl() {
        return baseUrl;
    }

    private void requireConfiguration() {
        URI uri;
        try {
            uri = URI.create(baseUrl);
        } catch (IllegalArgumentException error) {
            throw new ResponseStatusException(HttpStatus.SERVICE_UNAVAILABLE, "Invalid OCI media origin");
        }
        if (!"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost() == null
                || uri.getUserInfo() != null || !uri.getPath().isEmpty()
                || uri.getQuery() != null || uri.getFragment() != null || apiKey.length() < 32) {
            throw new ResponseStatusException(HttpStatus.SERVICE_UNAVAILABLE, "Configure HTTPS OCI origin and media API key");
        }
    }

    private HttpEntity<?> part(MultipartFile file, String mime, String filename) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType(mime));
        // Supply fixed filenames instead of forwarding untrusted client filenames.
        var resource = new AbstractResource() {
            @Override public String getDescription() { return filename; }
            @Override public String getFilename() { return filename; }
            @Override public long contentLength() { return file.getSize(); }
            @Override public InputStream getInputStream() throws IOException { return file.getInputStream(); }
        };
        return new HttpEntity<>(resource, headers);
    }

    private void validate(UUID id, UploadResponse response) {
        if (response == null || !id.equals(response.id()) || !videoUrl(id).equals(response.videoUrl())
                || !thumbnailUrl(id).equals(response.thumbnailUrl())) {
            throw new ResponseStatusException(HttpStatus.BAD_GATEWAY, "Unexpected OCI media response");
        }
    }

    private ResponseStatusException gatewayError(RestClientException error) {
        if (error instanceof RestClientResponseException response) {
            int status = response.getStatusCode().value();
            if (status == 409 || status == 413 || status == 415) {
                return new ResponseStatusException(HttpStatus.valueOf(status), "OCI rejected the media operation");
            }
        }
        // Never expose remote bodies or authentication details to the frontend.
        return new ResponseStatusException(HttpStatus.BAD_GATEWAY, "OCI media operation failed");
    }

    @Override
    public void upload(UUID id, MultipartFile file, MultipartFile thumbnail) {
        requireConfiguration();
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("file", part(file, "video/mp4", "video.mp4"));
        body.add("thumbnail", part(thumbnail, "image/webp", "thumbnail.webp"));
        try {
            UploadResponse response = client.post().uri("/api/videos/{id}", id)
                    .header("X-API-Key", apiKey).contentType(MediaType.MULTIPART_FORM_DATA)
                    .body(body).retrieve().body(UploadResponse.class);
            validate(id, response);
        } catch (RestClientException error) {
            throw gatewayError(error);
        }
    }

    @Override
    public boolean exists(UUID id) {
        requireConfiguration();
        try {
            UploadResponse response = client.get().uri("/api/videos/{id}", id)
                    .header("X-API-Key", apiKey).retrieve().body(UploadResponse.class);
            validate(id, response);
            return true;
        } catch (RestClientResponseException error) {
            if (error.getStatusCode().value() == 404) {
                return false;
            }
            throw gatewayError(error);
        } catch (RestClientException error) {
            throw gatewayError(error);
        }
    }

    @Override
    public void delete(UUID id) {
        requireConfiguration();
        try {
            client.delete().uri("/api/videos/{id}", id).header("X-API-Key", apiKey)
                    .retrieve().toBodilessEntity();
        } catch (RestClientResponseException error) {
            if (error.getStatusCode().value() != 404) {
                throw gatewayError(error);
            }
        } catch (RestClientException error) {
            throw gatewayError(error);
        }
    }
}
