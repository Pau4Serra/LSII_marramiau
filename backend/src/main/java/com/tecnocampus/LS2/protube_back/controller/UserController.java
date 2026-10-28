package com.tecnocampus.LS2.protube_back.controller;


import com.tecnocampus.LS2.protube_back.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/login")
    public void login() {
        userService.login();
    }

    @GetMapping("/logout")
    public void logout() {
        userService.logout();
    }

    @PatchMapping("/{userId}")
    public void updateUser(@PathVariable String userId) {
        userService.update();
    }
}
