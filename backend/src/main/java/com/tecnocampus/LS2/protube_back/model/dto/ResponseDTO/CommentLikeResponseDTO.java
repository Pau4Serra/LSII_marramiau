package com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO;

import java.util.UUID;

public record CommentLikeResponseDTO(
        UUID commentId,
        long likeCount,
        boolean likedByCurrentUser
) {
}
