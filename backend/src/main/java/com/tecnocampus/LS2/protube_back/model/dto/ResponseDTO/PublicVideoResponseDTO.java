package com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO;

import com.tecnocampus.LS2.protube_back.model.Category;

import java.time.Instant;
import java.util.List;
import java.util.UUID;

public record PublicVideoResponseDTO(
    UUID id,
    String title,
    int duration,
    String description,
    String thumbnail,
    String channelName,
    Long viewsCount,
    int likeCount,
    List<Category> categories,
    //List<Comment> comments,
    Instant uploadDate,
    String videoUrl
) {}
