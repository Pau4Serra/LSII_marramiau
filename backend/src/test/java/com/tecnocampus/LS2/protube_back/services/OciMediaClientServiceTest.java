package com.tecnocampus.LS2.protube_back.services;

import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestClient;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class OciMediaClientServiceTest {

    @Test
    void uploadReturnsValidOCIResponse() {
        RestClient.Builder builder = mock(RestClient.Builder.class);
        RestClient client = mock(RestClient.class);
        RestClient.RequestBodyUriSpec requestBody = mock(RestClient.RequestBodyUriSpec.class);
        RestClient.RequestBodySpec bodySpec = mock(RestClient.RequestBodySpec.class);
        RestClient.ResponseSpec response = mock(RestClient.ResponseSpec.class);

        when(builder.baseUrl("https://media.example")).thenReturn(builder);
        when(builder.build()).thenReturn(client);
        when(client.post()).thenReturn(requestBody);
        when(requestBody.uri("/api/videos")).thenReturn(bodySpec);
        when(bodySpec.header(org.springframework.http.HttpHeaders.AUTHORIZATION, "Bearer token")).thenReturn(bodySpec);
        when(bodySpec.contentType(MediaType.MULTIPART_FORM_DATA)).thenReturn(bodySpec);
        when(bodySpec.body(any(MultiValueMap.class))).thenReturn(bodySpec);
        when(bodySpec.retrieve()).thenReturn(response);
        when(response.body(OciMediaClientService.UploadResponse.class))
                .thenReturn(new OciMediaClientService.UploadResponse("id", "https://media.example/video.mp4"));

        OciMediaClientService service = new OciMediaClientService(builder, "https://media.example");
        MultipartFile file = mock(MultipartFile.class);

        OciMediaClientService.UploadResponse result = service.upload(file, "token");

        assertEquals("id", result.id());
        assertEquals("https://media.example/video.mp4", result.url());
    }

    @Test
    void uploadRejectsInvalidOCIResponse() {
        RestClient.Builder builder = mock(RestClient.Builder.class);
        RestClient client = mock(RestClient.class);
        RestClient.RequestBodyUriSpec requestBody = mock(RestClient.RequestBodyUriSpec.class);
        RestClient.RequestBodySpec bodySpec = mock(RestClient.RequestBodySpec.class);
        RestClient.ResponseSpec response = mock(RestClient.ResponseSpec.class);

        when(builder.baseUrl("https://media.example")).thenReturn(builder);
        when(builder.build()).thenReturn(client);
        when(client.post()).thenReturn(requestBody);
        when(requestBody.uri("/api/videos")).thenReturn(bodySpec);
        when(bodySpec.header(org.springframework.http.HttpHeaders.AUTHORIZATION, "Bearer token")).thenReturn(bodySpec);
        when(bodySpec.contentType(MediaType.MULTIPART_FORM_DATA)).thenReturn(bodySpec);
        when(bodySpec.body(any(MultiValueMap.class))).thenReturn(bodySpec);
        when(bodySpec.retrieve()).thenReturn(response);
        when(response.body(OciMediaClientService.UploadResponse.class)).thenReturn(null);

        OciMediaClientService service = new OciMediaClientService(builder, "https://media.example");

        assertThrows(IllegalStateException.class,
                () -> service.upload(mock(MultipartFile.class), "token"));
    }
}
