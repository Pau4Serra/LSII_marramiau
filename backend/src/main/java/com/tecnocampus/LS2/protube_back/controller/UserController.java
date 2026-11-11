package com.tecnocampus.LS2.protube_back.controller;


import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserResponseDTO;
import com.tecnocampus.LS2.protube_back.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/me")
    public UserResponseDTO getMe(@AuthenticationPrincipal OidcUser oidcUser) {
        return userService.getMe(oidcUser.getSubject());
    }

    @PatchMapping("/{userId}")
    public UserResponseDTO updateUser(@PathVariable UUID userId, @RequestBody UserResponseDTO userResponseDTO) {
        return userService.update(userId, userResponseDTO);
    }
}
