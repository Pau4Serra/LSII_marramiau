package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateCommentRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentLikeResponseDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentResponseDTO;
import com.tecnocampus.LS2.protube_back.services.CommentService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api")
public class CommentController {

    private final CommentService commentService;

    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    @GetMapping("/videos/{videoId}/comments")
    public ResponseEntity<List<CommentResponseDTO>> getComments(
            @PathVariable UUID videoId,
            @AuthenticationPrincipal OidcUser oidcUser) {

        String googleSubject = oidcUser != null ? oidcUser.getSubject() : null;
        return ResponseEntity.ok(commentService.getComments(videoId, googleSubject));
    }

    @PostMapping("/videos/{videoId}/comments")
    public ResponseEntity<CommentResponseDTO> createComment(
            @PathVariable UUID videoId,
            @Valid @RequestBody CreateCommentRequestDTO request,
            @AuthenticationPrincipal OidcUser oidcUser) {

        return ResponseEntity.status(HttpStatus.CREATED).body(
                commentService.createComment(videoId, request, getGoogleSubject(oidcUser))
        );
    }

    @PostMapping("/comments/{commentId}/replies")
    public ResponseEntity<CommentResponseDTO> createReply(
            @PathVariable UUID commentId,
            @Valid @RequestBody CreateCommentRequestDTO request,
            @AuthenticationPrincipal OidcUser oidcUser) {

        return ResponseEntity.status(HttpStatus.CREATED).body(
                commentService.createReply(commentId, request, getGoogleSubject(oidcUser))
        );
    }

    @PutMapping("/comments/{commentId}/like")
    public ResponseEntity<CommentLikeResponseDTO> likeComment(
            @PathVariable UUID commentId,
            @AuthenticationPrincipal OidcUser oidcUser) {

        return ResponseEntity.ok(
                commentService.likeComment(commentId, getGoogleSubject(oidcUser))
        );
    }

    @DeleteMapping("/comments/{commentId}/like")
    public ResponseEntity<CommentLikeResponseDTO> unlikeComment(
            @PathVariable UUID commentId,
            @AuthenticationPrincipal OidcUser oidcUser) {

        return ResponseEntity.ok(
                commentService.unlikeComment(commentId, getGoogleSubject(oidcUser))
        );
    }

    private String getGoogleSubject(OidcUser oidcUser) {
        return oidcUser != null ? oidcUser.getSubject() : null;
    }
}
