package com.tecnocampus.LS2.protube_back.model.dto.RequestDTO;

import com.tecnocampus.LS2.protube_back.model.Category;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

import java.util.List;

public record UpdateVideoMetadataRequestDTO(
        @Size(max = 255) @Pattern(regexp = "(?s).*\\S.*") String title,
        @Size(max = 10000) String description,
        @Size(max = 16) List<@NotNull Category> categories,
        @Size(max = 50) List<@NotBlank @Size(max = 100) String> tags
) {}
