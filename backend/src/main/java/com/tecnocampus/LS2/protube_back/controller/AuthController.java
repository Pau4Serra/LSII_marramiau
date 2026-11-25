package com.tecnocampus.LS2.protube_back.controller;

import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CsrfTokenResponseDTO;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/api/auth")
public class AuthController {

    @PostMapping("/login")
    public String login() {
        return "redirect:/oauth2/authorization/google";
    }

    @GetMapping("/csrf")
    @ResponseBody
    public CsrfTokenResponseDTO csrf(CsrfToken token) {
        return new CsrfTokenResponseDTO(token.getHeaderName(), token.getToken());
    }
}
