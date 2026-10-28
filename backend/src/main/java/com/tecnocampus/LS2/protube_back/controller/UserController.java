package com.tecnocampus.LS2.protube_back.controller;


import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserDTO;
import com.tecnocampus.LS2.protube_back.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    UserService userService;

    @PatchMapping("/{userId}")
    public UserDTO updateUser(@PathVariable UUID userId, @RequestBody UserDTO userDTO) {
        return userService.update(userId, userDTO);
    }
}
