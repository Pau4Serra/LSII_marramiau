package com.tecnocampus.LS2.protube_back.services;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestClient;

import static org.hamcrest.Matchers.startsWith;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.*;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

class OciMediaClientServiceTest {
    private final RestClient.Builder builder = RestClient.builder();
    private final MockRestServiceServer server = MockRestServiceServer.bindTo(builder).build();
    private final OciMediaClientService service = new OciMediaClientService(builder, "https://example.com");
    private final MockMultipartFile file = new MockMultipartFile("file", "video.mp4", "video/mp4", new byte[] {1});

    @Test
    void uploadsMultipartVideoWithBearerToken() {
        server.expect(requestTo("https://example.com/api/videos"))
                .andExpect(method(HttpMethod.POST))
                .andExpect(header(HttpHeaders.AUTHORIZATION, "Bearer token"))
                .andExpect(header(HttpHeaders.CONTENT_TYPE, startsWith(MediaType.MULTIPART_FORM_DATA_VALUE)))
                .andRespond(withSuccess("{\"id\":\"media\",\"url\":\"https://example.com/video.mp4\"}",
                        MediaType.APPLICATION_JSON));
        assertEquals(new OciMediaClientService.UploadResponse("media", "https://example.com/video.mp4"),
                service.upload(file, "token"));
        server.verify();
    }

    @Test
    void rejectsAnUploadResponseWithoutAUsableUrl() {
        server.expect(requestTo("https://example.com/api/videos"))
                .andRespond(withSuccess("{\"id\":\"media\",\"url\":\" \"}", MediaType.APPLICATION_JSON));
        assertThrows(IllegalStateException.class, () -> service.upload(file, "token"));
        server.verify();
    }
}
