package com.tecnocampus.LS2.protube_back;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tecnocampus.LS2.protube_back.model.Category;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jackson.JacksonAutoConfiguration;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Instant;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

@DataJpaTest(showSql = false, properties = "pro_tube.store.dir=")
@ActiveProfiles("dev")
@Import({DevDataLoader.class, JacksonAutoConfiguration.class})
class DevDataLoaderTest {
    @TempDir
    Path directory;
    @Autowired
    VideoRepository videos;
    @Autowired
    UserRepository users;
    @Autowired
    DevDataLoader configuredLoader;
    private final ObjectMapper mapper = new ObjectMapper();

    @Test
    void loadsJsonMetadataIntoH2AndSharesChannels() throws Exception {
        String description = "Descripció del vídeo. ".repeat(200);
        writeVideo("0.json", 0, description);
        writeVideo("1.json", 1, "Another video");
        Files.writeString(directory.resolve("ignored.txt"), "not JSON");
        Files.createDirectory(directory.resolve("ignored.json"));

        loader().run(null);
        videos.flush();

        var imported = videos.findAll();
        assertThat(imported).hasSize(2);
        assertThat(users.count()).isEqualTo(1);
        var video = imported.stream().filter(v -> v.getVideoUrl().endsWith("/0.mp4")).findFirst().orElseThrow();
        assertThat(video.getTitle()).isEqualTo("Vídeo de prova");
        assertThat(video.getDescription()).isEqualTo(description);
        assertThat(video.getDuration()).isEqualTo(80);
        assertThat(video.getViewCount()).isEqualTo(5_909_835_460L);
        assertThat(video.getLikeCount()).isEqualTo(23_573_933);
        assertThat(video.getUploadDate()).isEqualTo(Instant.ofEpochSecond(1416405618));
        assertThat(video.getStatus()).isEqualTo(VideoStatus.ACTIVE);
        assertThat(video.getCategories()).containsExactly(Category.MUSIC, Category.OTHER);
        assertThat(video.getThumbnail()).isEqualTo("https://media.example/0.webp");
        assertThat(video.getChannel().getName()).isEqualTo("Canal català");
        assertThat(video.getChannel().getGoogleSubject()).startsWith("dev-channel:");
    }

    @Test
    void defaultsOptionalMetadata() throws Exception {
        Files.writeString(directory.resolve("0.json"), """
                {"id":0,"title":"Title","duration":10,"timestamp":0,"meta":{"channel":"Channel"}}
                """);
        loader().run(null);
        var video = videos.findAll().getFirst();
        assertThat(video.getViewCount()).isZero();
        assertThat(video.getLikeCount()).isZero();
        assertThat(video.getCategories()).isEmpty();
        assertThat(video.getDescription()).isEmpty();
    }

    @Test
    void skipsWhenStoreIsNotConfigured() throws Exception {
        configuredLoader.run(null);
        assertThat(videos.count()).isZero();
    }

    @Test
    void emptyDirectoryIsAllowed() throws Exception {
        loader().run(null);
        assertThat(videos.count()).isZero();
    }

    @Test
    void reportsMissingDirectoryOrInvalidMetadata() throws Exception {
        var missing = new DevDataLoader(videos, users, mapper, directory.resolve("missing").toString(),
                "https://media.example");
        assertThrows(IOException.class, () -> missing.run(null));
        Files.writeString(directory.resolve("0.json"), "{broken");
        assertThrows(IOException.class, () -> loader().run(null));
        Files.writeString(directory.resolve("0.json"), "{}");
        var error = assertThrows(IOException.class, () -> loader().run(null));
        assertThat(error.getMessage()).contains("0.json");
    }

    @Test
    void disabledInProductionEvenIfDevIsAlsoActive() {
        for (String profiles : List.of("prod", "dev,prod")) {
            new ApplicationContextRunner().withUserConfiguration(DevDataLoader.class)
                    .withPropertyValues("spring.profiles.active=" + profiles)
                    .run(context -> assertThat(context).doesNotHaveBean(DevDataLoader.class));
        }
    }

    private DevDataLoader loader() {
        return new DevDataLoader(videos, users, mapper, directory.toString(), "https://media.example/");
    }

    private void writeVideo(String filename, int id, String description) throws Exception {
        mapper.writeValue(directory.resolve(filename).toFile(), Map.of(
                "id", id, "title", "Vídeo de prova", "duration", 79.6, "timestamp", 1416405618,
                "meta", Map.of("channel", "Canal català", "description", description,
                        "view_count", 5_909_835_460L, "like_count", 23_573_933,
                        "categories", List.of("Music", "Music", "Unknown"))));
    }
}
