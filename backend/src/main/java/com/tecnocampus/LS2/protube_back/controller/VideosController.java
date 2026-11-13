package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateVideoRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.PublicVideoResponseDTO;
import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/videos")
public class VideosController {

    @Autowired
    VideoService videoService;

    @GetMapping("")
    public ResponseEntity<List<PublicVideoResponseDTO>> getVideos() {
        return ResponseEntity.ok(videoService.getVideos());
    }

    @GetMapping("/{videoId}")
    public ResponseEntity<PublicVideoResponseDTO> getVideo(@PathVariable UUID videoId) {
        return ResponseEntity.of(videoService.findVideoById(videoId));
    }

    @GetMapping("/search/{query}")
    public ResponseEntity<List<PublicVideoResponseDTO>> getVideosByName(@PathVariable String query) {
        return ResponseEntity.ok(videoService.findVideosByName(query));
    }

    @PostMapping(
            value = "/upload",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE
    )
    public ResponseEntity<PublicVideoResponseDTO> uploadVideo(
            @RequestPart("metadata") CreateVideoRequestDTO metadata,
            @RequestPart("file") MultipartFile file,
            @AuthenticationPrincipal OidcUser user) {

        PublicVideoResponseDTO response = videoService.uploadVideo(
                metadata,
                file,
                user
        );

        return ResponseEntity.status(201).body(response);
    }

    @PatchMapping("/{videoId}")
    public ResponseEntity<String> deleteVideo(@PathVariable String videoId) {
        return ResponseEntity.ok().body("Video deleted successfully");
    }
}
