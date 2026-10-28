package com.tecnocampus.LS2.protube_back.security;

import com.tecnocampus.LS2.protube_back.services.UserService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class GoogleLoginSuccessHandlerTest {

    @Mock
    private UserService userService;

    @Mock
    private Authentication authentication;

    @Mock
    private OidcUser googleUser;

    @ParameterizedTest
    @ValueSource(strings = {"http://localhost:5173/", "/", "https://protube.example/"})
    void savesGoogleUserAndRedirectsToFrontend(String successUrl) throws Exception {
        when(authentication.getPrincipal()).thenReturn(googleUser);
        when(googleUser.getSubject()).thenReturn("google-subject");
        when(googleUser.getEmail()).thenReturn("user@example.com");
        when(googleUser.getGivenName()).thenReturn("Test");
        when(googleUser.getFamilyName()).thenReturn("User");
        when(googleUser.getPicture()).thenReturn("https://example.com/avatar.png");
        MockHttpServletResponse response = new MockHttpServletResponse();

        new GoogleLoginSuccessHandler(userService, successUrl)
                .onAuthenticationSuccess(new MockHttpServletRequest(), response, authentication);

        verify(userService).findOrCreateFromGoogle("google-subject", "user@example.com",
                "Test", "User", "https://example.com/avatar.png");
        assertEquals(302, response.getStatus());
        assertEquals(successUrl, response.getRedirectedUrl());
    }

    @Test
    void doesNotRedirectWhenUserPersistenceFails() {
        when(authentication.getPrincipal()).thenReturn(googleUser);
        when(googleUser.getSubject()).thenReturn("google-subject");
        doThrow(new IllegalStateException("Database unavailable"))
                .when(userService).findOrCreateFromGoogle("google-subject", null, null, null, null);
        MockHttpServletResponse response = new MockHttpServletResponse();
        GoogleLoginSuccessHandler handler = new GoogleLoginSuccessHandler(userService, "/");

        assertThrows(IllegalStateException.class,
                () -> handler.onAuthenticationSuccess(
                        new MockHttpServletRequest(), response, authentication));

        assertNull(response.getRedirectedUrl());
    }
}
