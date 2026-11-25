package com.tecnocampus.LS2.protube_back.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tecnocampus.LS2.protube_back.controller.AuthController;
import com.tecnocampus.LS2.protube_back.controller.UserController;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.CsrfTokenResponseDTO;
import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserResponseDTO;
import com.tecnocampus.LS2.protube_back.services.UserService;
import jakarta.servlet.http.Cookie;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;
import java.util.UUID;

import static org.hamcrest.Matchers.containsString;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.cookie;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest({AuthController.class, UserController.class})
@Import(SecurityConfig.class)
class LogoutIntegrationTest {
    private static final String LOGOUT_URL = "/api/auth/logout";
    private static final String CURRENT_USER_URL = "/api/users/me";

    @Autowired
    private MockMvc mvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private GoogleLoginSuccessHandler googleLoginSuccessHandler;

    @MockBean
    private ClientRegistrationRepository clientRegistrationRepository;

    @MockBean
    private UserService userService;

    private MockHttpSession session;

    @BeforeEach
    void createAuthenticatedSession() {
        var principal = mock(OidcUser.class);
        when(principal.getSubject()).thenReturn("google-subject");
        var authentication = UsernamePasswordAuthenticationToken.authenticated(principal, null, List.of());
        session = new MockHttpSession();
        session.setAttribute(SPRING_SECURITY_CONTEXT_KEY, new SecurityContextImpl(authentication));
        when(userService.getMe("google-subject")).thenReturn(new UserResponseDTO(
                UUID.randomUUID(), "google-subject", "user@example.com", "User", "", "", false));
    }

    @Test
    void logsOutAndExpiresTheSessionCookie() throws Exception {
        mvc.perform(get(CURRENT_USER_URL).session(session))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.googleSubject").value("google-subject"));

        var token = fetchCsrfToken();
        var sessionCookie = new Cookie("JSESSIONID", session.getId());

        mvc.perform(post(LOGOUT_URL).servletPath(LOGOUT_URL).session(session)
                        .cookie(sessionCookie).header(token.headerName(), token.token()))
                .andExpect(status().isNoContent())
                .andExpect(cookie().maxAge("JSESSIONID", 0));

        assertTrue(session.isInvalid());
        mvc.perform(get(CURRENT_USER_URL).cookie(sessionCookie))
                .andExpect(status().is3xxRedirection());
    }

    @Test
    void rejectsLogoutWithoutAValidCsrfToken() throws Exception {
        var token = fetchCsrfToken();

        mvc.perform(post(LOGOUT_URL).servletPath(LOGOUT_URL).session(session))
                .andExpect(status().isForbidden());
        mvc.perform(post(LOGOUT_URL).servletPath(LOGOUT_URL).session(session)
                        .header(token.headerName(), "invalid"))
                .andExpect(status().isForbidden());

        mvc.perform(get(CURRENT_USER_URL).session(session))
                .andExpect(status().isOk());
    }

    @Test
    void getDoesNotLogOut() throws Exception {
        mvc.perform(get(LOGOUT_URL).servletPath(LOGOUT_URL).session(session))
                .andExpect(status().isNotFound());
        mvc.perform(get(CURRENT_USER_URL).session(session))
                .andExpect(status().isOk());
    }

    private CsrfTokenResponseDTO fetchCsrfToken() throws Exception {
        var body = mvc.perform(get("/api/auth/csrf").session(session))
                .andExpect(status().isOk())
                .andExpect(header().string("Cache-Control", containsString("no-store")))
                .andReturn().getResponse().getContentAsString();
        return objectMapper.readValue(body, CsrfTokenResponseDTO.class);
    }
}
