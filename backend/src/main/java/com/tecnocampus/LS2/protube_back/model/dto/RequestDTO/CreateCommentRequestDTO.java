package com.tecnocampus.LS2.protube_back.model.dto.RequestDTO;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreateCommentRequestDTO(
        @NotBlank
        @Size(max = 1000)
        String content
) {
}
