package com.tecnocampus.LS2.protube_back.model.dto.RequestDTO;

public record CreateVideoRequestDTO(
    String title,
    Integer duration,
    String thumbnail,
    VideoMetadataRequestDTO meta
) {}
