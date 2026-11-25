package com.tecnocampus.LS2.protube_back.controller;


import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.PublicVideoResponseDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserResponseDTO;
import com.tecnocampus.LS2.protube_back.services.UserService;
import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    VideoService videoService;

    @GetMapping("/me")
    public UserResponseDTO getMe(@AuthenticationPrincipal OidcUser oidcUser) {
        return userService.getMe(oidcUser.getSubject());
    }

    @GetMapping("/me/liked-videos")
    public List<PublicVideoResponseDTO> getLikedVideos(@AuthenticationPrincipal OidcUser oidcUser) {
        return videoService.getLikedVideos(oidcUser.getSubject());
    }

    @PatchMapping("/{userId}")
    public UserResponseDTO updateUser(@PathVariable UUID userId, @RequestBody UserResponseDTO userResponseDTO) {
        return userService.update(userId, userResponseDTO);
    }

    @PatchMapping("/{userId}/darkMode")
    public void changeDarkMode(@PathVariable UUID userId) {
        userService.changeDarkMode(userId);
    }
}
