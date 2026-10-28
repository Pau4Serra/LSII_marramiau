package com.tecnocampus.LS2.protube_back.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
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
                .requestMatchers("/",
                        "/error",
                        "/public/**",
                        "/media/**",
                        "/auth/login",
                        "/api/videos",
                        "/api/videos/{videoId}",
                        "/h2-console",
                        "/h2-console/**")
                        .permitAll()
                .anyRequest().authenticated()).oauth2Login(oauth2 -> oauth2.successHandler(googleLoginSuccessHandler));

        return http.build();
    }
}
