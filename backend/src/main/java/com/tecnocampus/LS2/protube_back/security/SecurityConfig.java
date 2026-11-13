package com.tecnocampus.LS2.protube_back.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity  // Enables @PreAuthorize on controller methods
public class SecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http,
            GoogleLoginSuccessHandler googleLoginSuccessHandler) throws Exception {
        http.headers(headers -> headers
                        .frameOptions(frame -> frame.sameOrigin())
                ).csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(
                                "/",
                                "/error",
                                "/public/**",
                                "/media/**",
                                "/api/auth/login",
                                "/h2-console",
                                "/h2-console/**"
                        ).permitAll()

                        .requestMatchers(
                                HttpMethod.GET,
                                "/api/videos",
                                "/api/videos/search/{query}",
                                "/api/videos/{videoId}"
                        ).permitAll()

                        .anyRequest().authenticated()
                ).oauth2Login(oauth2 -> oauth2.successHandler(googleLoginSuccessHandler));

        return http.build();
    }
}
