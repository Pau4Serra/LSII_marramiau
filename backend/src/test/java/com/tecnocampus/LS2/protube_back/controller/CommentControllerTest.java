package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.RequestDTO.CreateCommentRequestDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CommentLikeResponseDTO;
import com.tecnocampus.LS2.protube_back.services.CommentService;
import org.junit.jupiter.api.Test;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;

import java.util.List;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

class CommentControllerTest {
    private final CommentService service = mock(CommentService.class);
    private final CommentController controller = new CommentController(service);

    @Test
    void allowsAnonymousReadsAndUsesTheAuthenticatedSubjectForWrites() {
        var id = UUID.randomUUID();
        var user = mock(OidcUser.class);
        when(user.getSubject()).thenReturn("subject");
        when(service.getComments(id, null)).thenReturn(List.of());
        var request = new CreateCommentRequestDTO("Comment");
        var liked = new CommentLikeResponseDTO(id, 1, true);
        var unliked = new CommentLikeResponseDTO(id, 0, false);
        when(service.likeComment(id, "subject")).thenReturn(liked);
        when(service.unlikeComment(id, "subject")).thenReturn(unliked);

        assertEquals(List.of(), controller.getComments(id, null).getBody());
        verify(service).getComments(id, null);
        assertEquals(201, controller.createComment(id, request, user).getStatusCode().value());
        assertEquals(201, controller.createReply(id, request, user).getStatusCode().value());
        verify(service).createComment(id, request, "subject");
        verify(service).createReply(id, request, "subject");
        assertEquals(liked, controller.likeComment(id, user).getBody());
        assertEquals(unliked, controller.unlikeComment(id, user).getBody());
    }
}
