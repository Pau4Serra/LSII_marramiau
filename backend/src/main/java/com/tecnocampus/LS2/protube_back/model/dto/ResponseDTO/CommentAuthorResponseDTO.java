package com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO;

import java.util.UUID;

public record CommentAuthorResponseDTO(
        UUID userId,
        String name,
        String pictureUrl
) {
}
