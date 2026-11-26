package com.tecnocampus.LS2.protube_back.services;

import com.tecnocampus.LS2.protube_back.model.*;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.VideoMetadataRequestDTO;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import com.tecnocampus.LS2.protube_back.services.media.MediaStorageContext;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.NullAndEmptySource;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.InjectMocks;
import org.mockito.ArgumentCaptor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import java.time.Instant;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class VideoServiceTest {
    @Mock VideoRepository videos;
    @Mock UserRepository users;
    @Mock MediaStorageContext media;
    @Mock OidcUser principal;
    @InjectMocks VideoService service;
    private final UUID id = UUID.randomUUID();
    private final MockMultipartFile file = new MockMultipartFile("file", "video.mp4", "video/mp4", new byte[]{1});
    private final MockMultipartFile thumbnail = new MockMultipartFile("thumbnail", "cover.webp", "image/webp", new byte[]{2});
    private final VideoMetadataRequestDTO metadata = new VideoMetadataRequestDTO(
            "Description", List.of("Gaming"), List.of(), 999L, 999, "untrusted", 999);
    private final CreateVideoRequestDTO request = new CreateVideoRequestDTO(" Video ", 25, metadata);

    @BeforeEach
    void setUp() {
        lenient().when(principal.getSubject()).thenReturn("subject");
        lenient().when(media.resolveUrl(any())).thenAnswer(call -> call.getArgument(0));
        lenient().when(media.videoUrl(any())).thenAnswer(call -> "https://media.test/media/" + call.getArgument(0) + "/video.mp4");
        lenient().when(media.thumbnailUrl(any())).thenAnswer(call -> "https://media.test/media/" + call.getArgument(0) + "/thumbnail.webp");
    }

    private void knownUser() {
        var channel = new User();
        channel.setName("Channel");
        when(users.findUserByGoogleSubject("subject")).thenReturn(channel);
    }

    @Test
    void buildsTheCompleteModelUploadsBothFilesAndOnlyThenSaves() {
        knownUser();
        var response = service.uploadVideo(request, file, thumbnail, principal);
        assertNotNull(response.id());
        assertEquals("Video", response.title());
        assertEquals("Channel", response.channelName());
        assertEquals(0L, response.viewsCount());
        assertEquals(0, response.likeCount());
        assertEquals(media.videoUrl(response.id()), response.videoUrl());
        assertEquals(media.thumbnailUrl(response.id()), response.thumbnail());
        var model = ArgumentCaptor.forClass(Video.class);
        var order = inOrder(media, videos);
        order.verify(media).upload(response.id(), file, thumbnail);
        order.verify(videos).saveAndFlush(model.capture());
        assertEquals(response.id(), model.getValue().getId());
        assertEquals(VideoStatus.ACTIVE, model.getValue().getStatus());
        assertEquals(response.thumbnail(), model.getValue().getThumbnail());
        assertEquals(response.videoUrl(), model.getValue().getVideoUrl());
        verify(principal, never()).getIdToken();
    }

    @Test
    void failedUploadsDoNotSaveAnyRowOrDeleteAnUnconfirmedUpload() {
        knownUser();
        var failure = new ResponseStatusException(HttpStatus.BAD_GATEWAY);
        doThrow(failure).when(media).upload(any(), eq(file), eq(thumbnail));
        assertSame(failure, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, file, thumbnail, principal)));
        verifyNoInteractions(videos);
        verify(media, never()).delete(any());
    }

    @Test
    void deletesTheUploadedPairIfSavingFailsAndPreservesTheOriginalError() {
        knownUser();
        var failure = new IllegalStateException("save failed");
        when(videos.saveAndFlush(any(Video.class))).thenThrow(failure);
        doThrow(new IllegalStateException("cleanup failed")).when(media).delete(any());
        var error = assertThrows(IllegalStateException.class,
                () -> service.uploadVideo(request, file, thumbnail, principal));
        assertSame(failure, error);
        assertEquals(1, error.getSuppressed().length);
        var model = ArgumentCaptor.forClass(Video.class);
        verify(videos).saveAndFlush(model.capture());
        verify(media).upload(model.getValue().getId(), file, thumbnail);
        verify(media).delete(model.getValue().getId());
    }

    @Test
    void rejectsUnknownUserBeforeSavingOrUploading() {
        var error = assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, file, thumbnail, principal));
        assertEquals(HttpStatus.NOT_FOUND, error.getStatusCode());
        verifyNoInteractions(videos);
        verify(media, never()).upload(any(), any(), any());
    }

    @Test
    void requiresAuthenticationForUploadAndDelete() {
        assertEquals(HttpStatus.UNAUTHORIZED, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, file, thumbnail, null)).getStatusCode());
        assertEquals(HttpStatus.UNAUTHORIZED, assertThrows(ResponseStatusException.class,
                () -> service.deleteVideo(id, null)).getStatusCode());
        when(principal.getSubject()).thenReturn(null);
        assertThrows(ResponseStatusException.class, () -> service.deleteVideo(id, principal));
        when(principal.getSubject()).thenReturn(" ");
        assertThrows(ResponseStatusException.class, () -> service.deleteVideo(id, principal));
        verifyNoInteractions(videos, users);
    }

    @ParameterizedTest
    @NullAndEmptySource
    @ValueSource(strings = {" "})
    void rejectsInvalidTitles(String title) {
        assertEquals(HttpStatus.BAD_REQUEST, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(new CreateVideoRequestDTO(title, 1, metadata), file, thumbnail, principal)).getStatusCode());
        verifyNoInteractions(videos, users);
    }

    @Test
    void rejectsMissingMetadataAndInvalidDuration() {
        for (CreateVideoRequestDTO invalid : new CreateVideoRequestDTO[]{null,
                new CreateVideoRequestDTO("x".repeat(256), 1, metadata),
                new CreateVideoRequestDTO("Video", null, metadata),
                new CreateVideoRequestDTO("Video", 0, metadata),
                new CreateVideoRequestDTO("Video", -1, metadata),
                new CreateVideoRequestDTO("Video", 1, null)}) {
            assertEquals(HttpStatus.BAD_REQUEST, assertThrows(ResponseStatusException.class,
                    () -> service.uploadVideo(invalid, file, thumbnail, principal)).getStatusCode());
        }
        verifyNoInteractions(videos, users);
    }

    @Test
    void rejectsMissingEmptyWrongMimeAndOversizedFilesBeforePersisting() {
        assertEquals(HttpStatus.BAD_REQUEST, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, null, thumbnail, principal)).getStatusCode());
        assertEquals(HttpStatus.BAD_REQUEST, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, file, new MockMultipartFile("thumbnail", new byte[0]), principal)).getStatusCode());
        assertEquals(HttpStatus.UNSUPPORTED_MEDIA_TYPE, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, thumbnail, thumbnail, principal)).getStatusCode());
        assertEquals(HttpStatus.UNSUPPORTED_MEDIA_TYPE, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, file, file, principal)).getStatusCode());
        MultipartFile large = mock(MultipartFile.class);
        when(large.getContentType()).thenReturn("video/mp4");
        when(large.getSize()).thenReturn(100L * 1024 * 1024 + 1);
        assertEquals(HttpStatus.PAYLOAD_TOO_LARGE, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, large, thumbnail, principal)).getStatusCode());
        when(large.getContentType()).thenReturn("image/webp");
        assertEquals(HttpStatus.PAYLOAD_TOO_LARGE, assertThrows(ResponseStatusException.class,
                () -> service.uploadVideo(request, file, large, principal)).getStatusCode());
        verifyNoInteractions(videos, users);
    }

    private Video owned(VideoStatus status) {
        var video = new Video();
        video.setId(id);
        video.setStatus(status);
        video.setVideoUrl(media.videoUrl(id));
        video.setThumbnail(media.thumbnailUrl(id));
        when(videos.findByIdAndChannel_GoogleSubject(id, "subject")).thenReturn(Optional.of(video));
        return video;
    }

    @Test
    void commitsLogicalDeletionBeforeDeletingMediaAndAllowsRetryAfterRemoteFailure() {
        var video = owned(VideoStatus.ACTIVE);
        doAnswer(call -> {
            assertEquals(VideoStatus.REMOVED, video.getStatus());
            verify(videos).saveAndFlush(video);
            throw new ResponseStatusException(HttpStatus.BAD_GATEWAY);
        }).doNothing().when(media).delete(id);
        assertThrows(ResponseStatusException.class, () -> service.deleteVideo(id, principal));
        Instant removed = video.getRemovedDate();
        assertNotNull(removed);
        service.deleteVideo(id, principal);
        assertEquals(removed, video.getRemovedDate());
        verify(videos).saveAndFlush(video);
        verify(media, times(2)).delete(id);
    }

    @Test
    void rejectsForeignPendingLegacyAndOtherStorageVideos() {
        assertEquals(HttpStatus.NOT_FOUND, assertThrows(ResponseStatusException.class,
                () -> service.deleteVideo(id, principal)).getStatusCode());
        var video = owned(VideoStatus.PENDING);
        assertEquals(HttpStatus.CONFLICT, assertThrows(ResponseStatusException.class,
                () -> service.deleteVideo(id, principal)).getStatusCode());
        video.setStatus(VideoStatus.ACTIVE);
        video.setVideoUrl("https://other.test/media/" + id + "/video.mp4");
        assertThrows(ResponseStatusException.class, () -> service.deleteVideo(id, principal));
        video.setVideoUrl(media.videoUrl(id));
        video.setThumbnail("http://localhost:8080/media/0.webp");
        assertThrows(ResponseStatusException.class, () -> service.deleteVideo(id, principal));
        assertEquals(VideoStatus.ACTIVE, video.getStatus());
        verify(media, never()).delete(any());
    }

    @Test
    void listsSearchesAndFindsOnlyActiveVideos() {
        var video = new Video();
        video.setId(id);
        video.setTitle("First video");
        video.setDuration(125);
        var channel = new User();
        channel.setName("Channel");
        video.setChannel(channel);
        when(videos.findByStatus(VideoStatus.ACTIVE)).thenReturn(List.of(video));
        when(videos.findByTitleContainingIgnoreCaseAndStatus("First", VideoStatus.ACTIVE)).thenReturn(List.of(video));
        when(videos.findByIdAndStatus(id, VideoStatus.ACTIVE)).thenReturn(Optional.of(video));
        var response = service.getVideos().getFirst();
        assertEquals("First video", response.title());
        assertEquals("Channel", response.channelName());
        assertEquals(List.of(response), service.findVideosByName(" First "));
        assertEquals(List.of(response), service.findVideosByName(" "));
        assertEquals(List.of(response), service.findVideosByName(null));
        assertEquals(Optional.of(response), service.findVideoById(id));
        assertTrue(service.findVideoById(UUID.randomUUID()).isEmpty());
    }
}
