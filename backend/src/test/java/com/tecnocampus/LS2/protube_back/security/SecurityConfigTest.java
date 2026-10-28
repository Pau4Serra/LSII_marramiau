package com.tecnocampus.LS2.protube_back.security;

import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.oauth2.client.OAuth2LoginConfigurer;
import org.springframework.security.web.DefaultSecurityFilterChain;

import static org.junit.jupiter.api.Assertions.assertSame;
import static org.mockito.Answers.RETURNS_SELF;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class SecurityConfigTest {

    @Mock(answer = RETURNS_SELF)
    private HttpSecurity http;

    @Mock
    private OAuth2LoginConfigurer<HttpSecurity> oauth2;

    @Captor
    private ArgumentCaptor<Customizer<OAuth2LoginConfigurer<HttpSecurity>>> oauth2Customizer;

    @ParameterizedTest
    @ValueSource(strings = {"http://localhost:5173/", "/", "https://protube.example/"})
    void redirectsToConfiguredFrontendAfterLogin(String successUrl) throws Exception {
        DefaultSecurityFilterChain filterChain = mock(DefaultSecurityFilterChain.class);
        when(http.build()).thenReturn(filterChain);

        assertSame(filterChain, new SecurityConfig().securityFilterChain(http, successUrl));

        verify(http).oauth2Login(oauth2Customizer.capture());
        oauth2Customizer.getValue().customize(oauth2);
        verify(oauth2).defaultSuccessUrl(successUrl, true);
    }
}
