package com.tecnocampus.LS2.protube_back;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tecnocampus.LS2.protube_back.model.Category;
import com.tecnocampus.LS2.protube_back.model.Comment;
import com.tecnocampus.LS2.protube_back.model.User;
import com.tecnocampus.LS2.protube_back.model.Video;
import com.tecnocampus.LS2.protube_back.model.VideoStatus;
import com.tecnocampus.LS2.protube_back.persistance.CommentRepository;
import com.tecnocampus.LS2.protube_back.persistance.UserRepository;
import com.tecnocampus.LS2.protube_back.persistance.VideoRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Component
@Profile("dev & !prod")
public class DevDataLoader implements ApplicationRunner {
    private static final Logger LOG = LoggerFactory.getLogger(DevDataLoader.class);
    private final VideoRepository videos;
    private final UserRepository users;
    private final CommentRepository comments;
    private final ObjectMapper mapper;
    private final String directory;
    private final String mediaBaseUrl;

    public DevDataLoader(VideoRepository videos, UserRepository users, CommentRepository comments, ObjectMapper mapper,
            @Value("${pro_tube.store.dir:}") String directory,
            @Value("${pro_tube.media.base-url}") String mediaBaseUrl) {
        this.videos = videos;
        this.users = users;
        this.comments = comments;
        this.mapper = mapper;
        this.directory = directory;
        this.mediaBaseUrl = mediaBaseUrl.replaceAll("/+$", "");
    }

    @Override
    @Transactional(rollbackFor = IOException.class)
    public void run(ApplicationArguments args) throws IOException {
        if (directory.isBlank()) {
            LOG.info("Skipping dev data: ENV_PROTUBE_STORE_DIR is not configured");
            return;
        }

        var channels = new HashMap<String, User>();
        int imported = 0;
        int importedComments = 0;
        try (var files = Files.list(Path.of(directory))) {
            for (Path file : files.filter(Files::isRegularFile)
                    .filter(path -> path.toString().endsWith(".json")).sorted().toList()) {
                JsonNode json = mapper.readTree(file.toFile());
                if (json == null || !json.hasNonNull("id") || !json.hasNonNull("title")
                        || !json.hasNonNull("duration") || !json.hasNonNull("timestamp")
                        || !json.path("meta").hasNonNull("channel")) {
                    throw new IOException("Missing required video metadata in " + file);
                }
                JsonNode meta = json.path("meta");
                String channelName = meta.path("channel").asText();
                User channel = channels.computeIfAbsent(channelName, name -> {
                    String id = UUID.nameUUIDFromBytes(name.getBytes(StandardCharsets.UTF_8)).toString();
                    return users.save(new User("dev-channel:" + id, id + "@catalog.invalid",
                            name, null, null, false));
                });

                var categories = new ArrayList<String>();
                meta.path("categories").forEach(category -> categories.add(category.asText()));
                Video video = new Video();
                video.setTitle(json.path("title").asText());
                video.setDescription(meta.path("description").asText(""));
                video.setDuration(Math.toIntExact(Math.round(json.path("duration").asDouble())));
                video.setThumbnail(mediaBaseUrl + "/" + json.path("id").asText() + ".webp");
                video.setVideoUrl(mediaBaseUrl + "/" + json.path("id").asText() + ".mp4");
                video.setStatus(VideoStatus.ACTIVE);
                video.setChannel(channel);
                video.setViewCount(meta.path("view_count").asLong(0));
                video.setLikeCount(meta.path("like_count").asInt(0));
                video.setUploadDate(Instant.ofEpochSecond(json.path("timestamp").asLong()));
                video.setCategories(Category.fromMetadataList(categories));
                Video savedVideo = videos.save(video);
                importedComments += importComments(meta.path("comments"), savedVideo, file);
                imported++;
            }
        }
        LOG.info("Loaded {} videos and {} comments into the dev database", imported, importedComments);
    }

    private int importComments(JsonNode commentNodes, Video video, Path file) throws IOException {
        List<Comment> importedComments = new ArrayList<>();
        for (JsonNode commentNode : commentNodes) {
            if (!commentNode.hasNonNull("text") || !commentNode.hasNonNull("author")
                    || !commentNode.hasNonNull("timestamp")) {
                throw new IOException("Missing required comment metadata in " + file);
            }

            String content = commentNode.get("text").asText();
            String author = commentNode.get("author").asText();
            if (content.isBlank() || author.isBlank()) {
                throw new IOException("Blank comment metadata in " + file);
            }

            Comment comment = new Comment();
            comment.setVideo(video);
            comment.setContent(content);
            comment.setAuthorDisplayName(author);
            comment.setCreatedAt(Instant.ofEpochSecond(commentNode.get("timestamp").asLong()));
            comment.setImportedLikeCount(commentNode.path("like_count").asLong(0));
            importedComments.add(comment);
        }

        comments.saveAll(importedComments);
        return importedComments.size();
    }
}