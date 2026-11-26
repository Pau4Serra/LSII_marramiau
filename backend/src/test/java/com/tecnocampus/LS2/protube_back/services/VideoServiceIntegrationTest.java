package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.VideoMetadataRequestDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import com.tecnocampus.LS2.protube_back.services.media.MediaStorageContext;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@DataJpaTest(showSql = false)
@ActiveProfiles("dev")
@Import(VideoService.class)
@Transactional(propagation = Propagation.NOT_SUPPORTED)
class VideoServiceIntegrationTest {
    @Autowired VideoService service;
    @Autowired VideoRepository videos;
    @Autowired UserRepository users;
    @MockBean MediaStorageContext media;
    private OidcUser principal;
    private UUID ownerId;
    private final MockMultipartFile file = new MockMultipartFile("file", "video.mp4", "video/mp4", new byte[]{1});
    private final MockMultipartFile thumbnail = new MockMultipartFile("thumbnail", "thumbnail.webp", "image/webp", new byte[]{2});
    private final CreateVideoRequestDTO request = new CreateVideoRequestDTO("Video", 1,
            new VideoMetadataRequestDTO("Description", List.of("Gaming"), List.of(), 100L, 100, "untrusted", 0));

    @BeforeEach
    void setUp() {
        String subject = UUID.randomUUID().toString();
        ownerId = users.saveAndFlush(new User(subject, subject + "@example.test", "Owner", null, null, false)).getId();
        principal = mock(OidcUser.class);
        when(principal.getSubject()).thenReturn(subject);
        when(media.videoUrl(any())).thenAnswer(call -> "https://media.test/media/" + call.getArgument(0) + "/video.mp4");
        when(media.thumbnailUrl(any())).thenAnswer(call -> "https://media.test/media/" + call.getArgument(0) + "/thumbnail.webp");
        when(media.resolveUrl(any())).thenAnswer(call -> call.getArgument(0));
    }

    @Test
    void uploadsBeforeSavingAndCommitsLogicalDeletionBeforeRemoteIo() {
        doAnswer(call -> {
            assertFalse(TransactionSynchronizationManager.isActualTransactionActive());
            UUID id = call.getArgument(0);
            assertNotNull(id);
            assertTrue(videos.findById(id).isEmpty());
            return null;
        }).when(media).upload(any(), eq(file), eq(thumbnail));
        var response = service.uploadVideo(request, file, thumbnail, principal);
        assertNotNull(response.id());
        assertEquals(0L, response.viewsCount());
        assertEquals(VideoStatus.ACTIVE, videos.findById(response.id()).orElseThrow().getStatus());
        var foreign = mock(OidcUser.class);
        when(foreign.getSubject()).thenReturn("not-the-owner");
        assertEquals(HttpStatus.NOT_FOUND, assertThrows(ResponseStatusException.class,
                () -> service.deleteVideo(response.id(), foreign)).getStatusCode());

        doAnswer(call -> {
            assertFalse(TransactionSynchronizationManager.isActualTransactionActive());
            assertEquals(VideoStatus.REMOVED, videos.findById(response.id()).orElseThrow().getStatus());
            throw new ResponseStatusException(HttpStatus.BAD_GATEWAY);
        }).doNothing().when(media).delete(response.id());
        assertThrows(ResponseStatusException.class, () -> service.deleteVideo(response.id(), principal));
        assertNotNull(videos.findById(response.id()).orElseThrow().getRemovedDate());
        assertTrue(service.findVideoById(response.id()).isEmpty());
        service.deleteVideo(response.id(), principal);
        verify(media, times(2)).delete(response.id());
    }

    @Test
    void failedSaveLeavesNoVideoRowAndCompensatesTheConfirmedUpload() {
        var id = new AtomicReference<UUID>();
        doAnswer(call -> {
            id.set(call.getArgument(0));
            // Simulate the owner disappearing while the files are being uploaded.
            users.deleteById(ownerId);
            return null;
        }).when(media).upload(any(), any(), any());
        assertThrows(RuntimeException.class, () -> service.uploadVideo(request, file, thumbnail, principal));
        assertTrue(videos.findById(id.get()).isEmpty());
        verify(media).delete(id.get());
    }
}
