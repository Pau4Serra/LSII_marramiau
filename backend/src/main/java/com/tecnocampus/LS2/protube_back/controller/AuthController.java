package com.tecnocampus.LS2.protube_back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @PostMapping("/login")
    public String login() {
        return "redirect:/oauth2/authorization/google";
    }
}
