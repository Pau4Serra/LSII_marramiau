package com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO;

import java.time.Instant;
import java.util.List;
import java.util.UUID;

public record CommentResponseDTO(
        UUID id,
        CommentAuthorResponseDTO author,
        String content,
        Instant createdAt,
        long likeCount,
        boolean likedByCurrentUser,
        List<CommentResponseDTO> replies
) {
}
