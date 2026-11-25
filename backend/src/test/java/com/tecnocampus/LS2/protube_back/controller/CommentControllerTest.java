package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateCommentRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentLikeResponseDTO;
import com.tecnocampus.LS2.protube_back.services.CommentService;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;

import java.util.List;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class CommentControllerTest {
    private final CommentService service = mock(CommentService.class);
    private final CommentController controller = new CommentController(service);

    @Test
    void allowsAnonymousUsersToReadComments() {
        var videoId = UUID.randomUUID();
        when(service.getComments(videoId, null)).thenReturn(List.of());

        assertEquals(List.of(), controller.getComments(videoId, null).getBody());
        verify(service).getComments(videoId, null);
    }

    @Test
    void createsCommentsAndRepliesForTheAuthenticatedUser() {
        var id = UUID.randomUUID();
        var request = new CreateCommentRequestDTO("Hello");
        var user = mock(OidcUser.class);
        when(user.getSubject()).thenReturn("google-subject");

        assertEquals(HttpStatus.CREATED, controller.createComment(id, request, user).getStatusCode());
        assertEquals(HttpStatus.CREATED, controller.createReply(id, request, user).getStatusCode());

        verify(service).createComment(id, request, "google-subject");
        verify(service).createReply(id, request, "google-subject");
    }

    @Test
    void returnsTheUpdatedLikeStateForTheAuthenticatedUser() {
        var commentId = UUID.randomUUID();
        var user = mock(OidcUser.class);
        when(user.getSubject()).thenReturn("google-subject");
        var liked = new CommentLikeResponseDTO(commentId, 1, true);
        var unliked = new CommentLikeResponseDTO(commentId, 0, false);
        when(service.likeComment(commentId, "google-subject")).thenReturn(liked);
        when(service.unlikeComment(commentId, "google-subject")).thenReturn(unliked);

        assertEquals(liked, controller.likeComment(commentId, user).getBody());
        assertEquals(unliked, controller.unlikeComment(commentId, user).getBody());
    }
}
