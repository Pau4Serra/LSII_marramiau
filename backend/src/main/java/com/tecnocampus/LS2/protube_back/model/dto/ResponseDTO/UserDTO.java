package com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO;

import java.util.UUID;

public record UserDTO(
    UUID id,
    String googleSubject,
    String email,
    String name,
    String lastname,
    String pictureUrl
) {}
