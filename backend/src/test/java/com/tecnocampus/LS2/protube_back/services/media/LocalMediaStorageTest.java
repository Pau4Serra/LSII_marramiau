package com.tecnocampus.LS2.protube_back.services.media;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.http.HttpStatus;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;
import static org.junit.jupiter.api.Assertions.*;
import static org.junit.jupiter.api.Assumptions.assumeTrue;
import static org.mockito.Mockito.*;

class LocalMediaStorageTest {
    @TempDir Path root;
    private LocalMediaStorage storage;
    private final UUID id = UUID.randomUUID();
    private final MockMultipartFile video = new MockMultipartFile("file", new byte[]{1, 2});
    private final MockMultipartFile thumbnail = new MockMultipartFile("thumbnail", new byte[]{3});

    @BeforeEach
    void setUp() {
        storage = new LocalMediaStorage(root.resolve("media with spaces").toString(), "http://localhost:8080/");
    }

    @Test
    void publishesThePairWithoutOverwritingAndDeletesIdempotently() throws Exception {
        assertFalse(storage.exists(id));
        assertEquals("http://localhost:8080", storage.baseUrl());
        storage.upload(id, video, thumbnail);
        assertTrue(storage.exists(id));
        assertArrayEquals(new byte[]{1, 2}, Files.readAllBytes(storage.directory().resolve(id + "/video.mp4")));
        assertArrayEquals(new byte[]{3}, Files.readAllBytes(storage.directory().resolve(id + "/thumbnail.webp")));
        assertEquals(HttpStatus.CONFLICT, assertThrows(ResponseStatusException.class,
                () -> storage.upload(id, video, thumbnail)).getStatusCode());
        storage.delete(id);
        storage.delete(id);
        assertFalse(storage.exists(id));
        try (var files = Files.list(storage.directory())) {
            assertEquals(0, files.filter(path -> path.getFileName().toString().startsWith(".upload-")).count());
        }
    }

    @Test
    void failsOnIncompletePairButCanDeleteIt() throws Exception {
        Path target = Files.createDirectories(storage.directory().resolve(id.toString()));
        Files.write(target.resolve("video.mp4"), new byte[]{1});
        assertEquals(HttpStatus.CONFLICT, assertThrows(ResponseStatusException.class,
                () -> storage.exists(id)).getStatusCode());
        storage.delete(id);
        assertFalse(Files.exists(target));
    }

    @Test
    void refusesUnexpectedFilesBeforeDeletingAnyMedia() throws Exception {
        storage.upload(id, video, thumbnail);
        Path target = storage.directory().resolve(id.toString());
        Files.writeString(target.resolve("keep.txt"), "keep");
        assertThrows(ResponseStatusException.class, () -> storage.delete(id));
        assertTrue(Files.exists(target.resolve("video.mp4")));
        assertTrue(Files.exists(target.resolve("thumbnail.webp")));
    }

    @Test
    void cleansPartialCopyAndNeverPublishesAnIncompletePair() throws Exception {
        MultipartFile broken = mock(MultipartFile.class);
        doThrow(new IOException("test copy failure")).when(broken).transferTo(any(Path.class));
        assertEquals(HttpStatus.INTERNAL_SERVER_ERROR, assertThrows(ResponseStatusException.class,
                () -> storage.upload(id, video, broken)).getStatusCode());
        assertFalse(storage.exists(id));
        try (var files = Files.list(storage.directory())) {
            assertEquals(0, files.filter(path -> path.getFileName().toString().startsWith(".upload-")).count());
        }
    }

    @Test
    void refusesAFileWhereADirectoryIsExpected() throws Exception {
        Files.createDirectories(storage.directory());
        Files.writeString(storage.directory().resolve(id.toString()), "keep");
        assertThrows(ResponseStatusException.class, () -> storage.exists(id));
        assertThrows(ResponseStatusException.class, () -> storage.delete(id));
        assertThrows(ResponseStatusException.class, () -> storage.upload(id, video, thumbnail));
    }

    private void symlink(Path link, Path target) throws Exception {
        try {
            Files.createSymbolicLink(link, target);
        } catch (IOException | UnsupportedOperationException error) {
            assumeTrue(false, "Symlink privileges unavailable on this host");
        }
    }

    @Test
    void refusesSymlinkDirectoriesAndFiles() throws Exception {
        Path outside = Files.createDirectory(root.resolve("outside"));
        Files.writeString(outside.resolve("video.mp4"), "keep");
        Files.createDirectories(storage.directory());
        Path target = storage.directory().resolve(id.toString());
        symlink(target, outside);
        assertThrows(ResponseStatusException.class, () -> storage.exists(id));
        assertThrows(ResponseStatusException.class, () -> storage.delete(id));
        Files.delete(target);
        Files.createDirectory(target);
        symlink(target.resolve("video.mp4"), outside.resolve("video.mp4"));
        assertThrows(ResponseStatusException.class, () -> storage.delete(id));
        assertEquals("keep", Files.readString(outside.resolve("video.mp4")));
    }

    @Test
    void refusesSymlinkStorageRoot() throws Exception {
        symlink(storage.directory(), root);
        assertThrows(ResponseStatusException.class, () -> storage.upload(id, video, thumbnail));
    }

    @Test
    void stagesBothFilesInATemporaryFolderBeforePublishing() throws Exception {
        MultipartFile observedThumbnail = mock(MultipartFile.class);
        doAnswer(call -> {
            Path destination = call.getArgument(0);
            assertTrue(destination.startsWith(storage.directory()));
            assertTrue(destination.getParent().getFileName().toString().startsWith(".upload-"));
            assertFalse(Files.exists(storage.directory().resolve(id.toString())));
            assertTrue(Files.exists(destination.getParent().resolve("video.mp4")));
            Files.write(destination, new byte[]{3});
            return null;
        }).when(observedThumbnail).transferTo(any(Path.class));
        storage.upload(id, video, observedThumbnail);
        assertTrue(storage.exists(id));
    }
}
