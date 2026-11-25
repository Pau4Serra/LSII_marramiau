package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.VideoLikeResponseDTO;
import com.tecnocampus.LS2.protube_back.services.VideoLikeService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/videos/{videoId}/like")
public class VideoLikeController {
    private final VideoLikeService likes;

    public VideoLikeController(VideoLikeService likes) {
        this.likes = likes;
    }

    @GetMapping
    public VideoLikeResponseDTO get(@PathVariable UUID videoId, @AuthenticationPrincipal OidcUser user) {
        return likes.get(videoId, subject(user));
    }

    @PutMapping
    public VideoLikeResponseDTO set(@PathVariable UUID videoId, @AuthenticationPrincipal OidcUser user) {
        return likes.set(videoId, subject(user), true);
    }

    @DeleteMapping
    public VideoLikeResponseDTO remove(@PathVariable UUID videoId, @AuthenticationPrincipal OidcUser user) {
        return likes.set(videoId, subject(user), false);
    }

    private String subject(OidcUser user) {
        return user == null ? null : user.getSubject();
    }
}
