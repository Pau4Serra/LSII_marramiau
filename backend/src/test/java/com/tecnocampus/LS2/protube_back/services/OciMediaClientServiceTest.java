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
import static org.springframework.test.web.client.match.MockRestRequestMatchers.header;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

class OciMediaClientServiceTest {
    @Test
    void uploadsMultipartVideoWithTheUsersToken() {
        var builder = RestClient.builder();
        var server = MockRestServiceServer.bindTo(builder).build();
        var service = new OciMediaClientService(builder, "https://example.com");
        var file = new MockMultipartFile("file", "video.mp4", "video/mp4", new byte[] {1});

        server.expect(requestTo("https://example.com/api/videos"))
                .andExpect(method(HttpMethod.POST))
                .andExpect(header(HttpHeaders.AUTHORIZATION, "Bearer user-token"))
                .andExpect(header(HttpHeaders.CONTENT_TYPE, startsWith(MediaType.MULTIPART_FORM_DATA_VALUE)))
                .andRespond(withSuccess("""
                        {"id":"media-id","url":"https://example.com/video.mp4"}
                        """, MediaType.APPLICATION_JSON));

        assertEquals(new OciMediaClientService.UploadResponse("media-id", "https://example.com/video.mp4"),
                service.upload(file, "user-token"));
        server.verify();
    }
}
