package com.tecnocampus.LS2.protube_back.controller;

import org.junit.jupiter.api.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

class AuthControllerTest {

    @Test
    void loginRedirectsToGoogleAuthorizationEndpoint() throws Exception {
        MockMvc mockMvc = MockMvcBuilders.standaloneSetup(new AuthController()).build();

        mockMvc.perform(post("/auth/login"))
                .andExpect(status().isFound())
                .andExpect(redirectedUrl("/oauth2/authorization/google"));
    }
}
