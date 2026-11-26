package com.tecnocampus.LS2.protube_back.services.media;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestClient;
import org.springframework.web.server.ResponseStatusException;
import java.io.IOException;
import java.util.UUID;
import static org.hamcrest.Matchers.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.*;
import static org.springframework.test.web.client.response.MockRestResponseCreators.*;

class OciMediaClientServiceTest {
    private static final String BASE = "https://media.example.test";
    private static final String KEY = "test-only-" + "x".repeat(32);
    private final RestClient.Builder builder = RestClient.builder().baseUrl(BASE);
    private final MockRestServiceServer server = MockRestServiceServer.bindTo(builder).build();
    private final OciMediaClientService service = new OciMediaClientService(builder.build(), BASE, KEY);
    private final UUID id = UUID.randomUUID();
    private final String endpoint = BASE + "/api/videos/" + id;
    private final MockMultipartFile file = new MockMultipartFile("file", "../../evil", "video/mp4", "video".getBytes());
    private final MockMultipartFile thumbnail = new MockMultipartFile("thumbnail", "", "image/webp", "thumb".getBytes());

    private String response() {
        return "{\"id\":\"" + id + "\",\"videoUrl\":\"" + service.videoUrl(id)
                + "\",\"thumbnailUrl\":\"" + service.thumbnailUrl(id) + "\"}";
    }

    @Test
    void uploadsBothPartsUsingTheProvidedUuidAndServiceKey() {
        server.expect(requestTo(endpoint)).andExpect(method(HttpMethod.POST))
                .andExpect(header("X-API-Key", KEY)).andExpect(headerDoesNotExist(HttpHeaders.AUTHORIZATION))
                .andExpect(header(HttpHeaders.CONTENT_TYPE, startsWith(MediaType.MULTIPART_FORM_DATA_VALUE)))
                .andExpect(content().string(allOf(containsString("name=\"file\"; filename=\"video.mp4\""),
                        containsString("name=\"thumbnail\"; filename=\"thumbnail.webp\""),
                        containsString("Content-Type: video/mp4"), containsString("Content-Type: image/webp"),
                        containsString("video"), containsString("thumb"), not(containsString("../../evil")))))
                .andRespond(withStatus(HttpStatus.CREATED).contentType(MediaType.APPLICATION_JSON).body(response()));
        service.upload(id, file, thumbnail);
        server.verify();
    }

    @Test
    void checksExistenceAndDeletesIdempotently() {
        server.expect(requestTo(endpoint)).andExpect(method(HttpMethod.GET))
                .andExpect(header("X-API-Key", KEY)).andRespond(withSuccess(response(), MediaType.APPLICATION_JSON));
        server.expect(requestTo(endpoint)).andRespond(withResourceNotFound());
        server.expect(requestTo(endpoint)).andExpect(method(HttpMethod.DELETE))
                .andExpect(header("X-API-Key", KEY)).andRespond(withNoContent());
        server.expect(requestTo(endpoint)).andRespond(withResourceNotFound());
        assertTrue(service.exists(id));
        assertFalse(service.exists(id));
        service.delete(id);
        service.delete(id);
        server.verify();
    }

    @ParameterizedTest
    @ValueSource(strings = {"", "{}", "{\"id\":\"invalid\"}", "{\"id\":null}"})
    void rejectsMissingOrMalformedResponse(String body) {
        server.expect(requestTo(endpoint)).andRespond(withSuccess(body, MediaType.APPLICATION_JSON));
        assertEquals(HttpStatus.BAD_GATEWAY, assertThrows(ResponseStatusException.class,
                () -> service.upload(id, file, thumbnail)).getStatusCode());
    }

    @Test
    void rejectsWrongIdentityAndUnexpectedUrls() {
        server.expect(requestTo(endpoint)).andRespond(withSuccess(response().replace(id.toString(), UUID.randomUUID().toString()), MediaType.APPLICATION_JSON));
        server.expect(requestTo(endpoint)).andRespond(withSuccess(response().replace("video.mp4", "other.mp4"), MediaType.APPLICATION_JSON));
        server.expect(requestTo(endpoint)).andRespond(withSuccess(response().replace("thumbnail.webp", "other.webp"), MediaType.APPLICATION_JSON));
        assertThrows(ResponseStatusException.class, () -> service.exists(id));
        assertThrows(ResponseStatusException.class, () -> service.exists(id));
        assertThrows(ResponseStatusException.class, () -> service.exists(id));
    }

    @ParameterizedTest
    @ValueSource(ints = {401, 403, 404, 409, 413, 415, 500})
    void translatesRemoteErrorsWithoutExposingTheirBodies(int status) {
        server.expect(requestTo(endpoint)).andRespond(withStatus(HttpStatus.valueOf(status)).body("PRIVATE REMOTE DETAILS"));
        var error = assertThrows(ResponseStatusException.class, () -> service.upload(id, file, thumbnail));
        assertEquals(status == 409 || status == 413 || status == 415 ? status : 502, error.getStatusCode().value());
        assertFalse(error.getMessage().contains("PRIVATE"));
    }

    @Test
    void incompletePairIsNotTreatedAsAbsentAndDeleteFailureIsReported() {
        server.expect(requestTo(endpoint)).andRespond(withStatus(HttpStatus.CONFLICT));
        server.expect(requestTo(endpoint)).andRespond(withServerError());
        assertEquals(HttpStatus.CONFLICT, assertThrows(ResponseStatusException.class, () -> service.exists(id)).getStatusCode());
        assertEquals(HttpStatus.BAD_GATEWAY, assertThrows(ResponseStatusException.class, () -> service.delete(id)).getStatusCode());
    }

    @Test
    void mapsNetworkErrorsForAllOperations() {
        for (int i = 0; i < 3; i++) {
            server.expect(requestTo(endpoint)).andRespond(request -> { throw new IOException("network error"); });
        }
        assertThrows(ResponseStatusException.class, () -> service.upload(id, file, thumbnail));
        assertThrows(ResponseStatusException.class, () -> service.exists(id));
        assertThrows(ResponseStatusException.class, () -> service.delete(id));
    }

    @ParameterizedTest
    @ValueSource(strings = {"http://media.test", "https://media.test/media", "https://user:pass@media.test", "not a uri"})
    void requiresHttpsOriginOnlyWhenUsed(String base) {
        var invalid = new OciMediaClientService(builder.build(), base, KEY);
        assertEquals(HttpStatus.SERVICE_UNAVAILABLE, assertThrows(ResponseStatusException.class,
                () -> invalid.exists(id)).getStatusCode());
        server.verify();
    }

    @Test
    void canConstructWithoutAKeyForLocalModeButCannotPerformOciOperations() {
        var local = new OciMediaClientService(RestClient.builder(), BASE, "");
        assertEquals(BASE, local.baseUrl());
        assertEquals(HttpStatus.SERVICE_UNAVAILABLE, assertThrows(ResponseStatusException.class,
                () -> local.upload(id, file, thumbnail)).getStatusCode());
    }
}
