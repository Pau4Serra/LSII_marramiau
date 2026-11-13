package com.tecnocampus.LS2.protube_back.model.dto.RequestDTO;

import java.util.List;

public record VideoMetadataRequestDTO(
        String description,
        List<String> categories,
        List<String> tags,
        Long view_count,
        int like_count,
        String channel,
        int channel_follower_count
) {
}
