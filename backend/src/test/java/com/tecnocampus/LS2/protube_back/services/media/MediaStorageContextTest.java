package com.tecnocampus.LS2.protube_back.services.media;

import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockMultipartFile;
import java.util.UUID;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class MediaStorageContextTest {
    @Test
    void selectsLocalOnceAndDelegatesOperationsAndCanonicalUrls() {
        var local = mock(LocalMediaStorage.class);
        var oci = mock(OciMediaClientService.class);
        var context = new MediaStorageContext(local, oci, " LOCAL ");
        var id = UUID.randomUUID();
        var file = new MockMultipartFile("file", new byte[]{1});
        when(local.baseUrl()).thenReturn("http://localhost:8080");
        when(local.exists(id)).thenReturn(true);
        assertTrue(context.isLocal());
        context.upload(id, file, file);
        assertTrue(context.exists(id));
        context.delete(id);
        verify(local).upload(id, file, file);
        verify(local).delete(id);
        assertEquals("http://localhost:8080/media/" + id + "/video.mp4", context.videoUrl(id));
        assertEquals("http://localhost:8080/media/" + id + "/thumbnail.webp", context.thumbnailUrl(id));
        assertEquals("http://localhost:8080/media/example", context.resolveUrl("/media/example"));
        assertEquals("https://other.test/video", context.resolveUrl("https://other.test/video"));
        assertNull(context.resolveUrl(null));
        verifyNoInteractions(oci);
    }

    @Test
    void selectsOciAndRejectsUnknownModes() {
        var local = mock(LocalMediaStorage.class);
        var oci = mock(OciMediaClientService.class);
        var context = new MediaStorageContext(local, oci, "oCi");
        var id = UUID.randomUUID();
        assertFalse(context.isLocal());
        context.delete(id);
        verify(oci).delete(id);
        assertThrows(IllegalArgumentException.class, () -> new MediaStorageContext(local, oci, "other"));
        verifyNoInteractions(local);
    }
}
