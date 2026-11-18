package com.tecnocampus.LS2.protube_back.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClient;
import org.springframework.web.multipart.MultipartFile;

@Component
public class OciMediaClientService {

    private final RestClient client;

    public OciMediaClientService(
            RestClient.Builder builder,
            @Value("${pro_tube.media.base-url}") String baseUrl) {

        this.client = builder.baseUrl(baseUrl).build();
    }

    public record UploadResponse(String id, String url) {}

    public UploadResponse upload(
            MultipartFile file,
            String googleIdToken) {

        HttpHeaders fileHeaders = new HttpHeaders();
        fileHeaders.setContentType(MediaType.valueOf("video/mp4"));

        MultiValueMap<String, Object> body =
                new LinkedMultiValueMap<>();

        body.add("file", new HttpEntity<>(
                file.getResource(), fileHeaders));

        UploadResponse response = client.post()
                .uri("/api/videos")
                .header(
                        HttpHeaders.AUTHORIZATION,
                        "Bearer " + googleIdToken
                )
                .contentType(MediaType.MULTIPART_FORM_DATA)
                .body(body)
                .retrieve()
                .body(UploadResponse.class);

        if (response == null ||
                response.id() == null ||
                response.url() == null ||
                response.url().isBlank()) {
            throw new IllegalStateException(
                    "Invalid response from OCI");
        }

        return response;
    }
}
