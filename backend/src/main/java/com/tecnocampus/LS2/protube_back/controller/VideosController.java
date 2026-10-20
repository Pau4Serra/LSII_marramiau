package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.PublicVideoResponseDTO;
import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/upload")
    public ResponseEntity<String> uploadVideo() {
        return ResponseEntity.ok().body("Video uploaded successfully");
    }

    @GetMapping("/search/{query}")
    public ResponseEntity<List<String>> searchVideos(@PathVariable String query) {
        return ResponseEntity.ok().body(List.of("video1", "video2"));
    }

    @PatchMapping("/{videoId}")
    public ResponseEntity<String> deleteVideo(@PathVariable String videoId) {
        return ResponseEntity.ok().body("Video deleted successfully");
    }
}
