package com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO;

import com.tecnocampus.LS2.protube_back.model.VideoStatus;

import java.time.Instant;
import java.util.UUID;

public record VideoAnalyticsResponseDTO(
        UUID id,
        String title,
        String thumbnail,
        Instant uploadDate,
        VideoStatus status,
        Long viewsCount,
        Integer likeCount,
        Long commentCount
) {}
