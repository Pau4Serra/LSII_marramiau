
package com.tecnocampus.LS2.protube_back.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.HttpStatusReturningLogoutSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(
            HttpSecurity http,
            GoogleLoginSuccessHandler googleLoginSuccessHandler
    ) throws Exception {
        var logoutRequest = new AntPathRequestMatcher("/api/auth/logout", HttpMethod.POST.name());
        http
            .cors(Customizer.withDefaults())
            .headers(headers -> headers
                .frameOptions(frame -> frame.sameOrigin())
            )
            .csrf(csrf -> csrf.requireCsrfProtectionMatcher(logoutRequest))
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(
                        "/",
                        "/error",
                        "/public/**",
                        "/api/auth/login",
                        "/h2-console",
                        "/h2-console/**"
                ).permitAll()
                .requestMatchers(
                        HttpMethod.GET,
                        "/api/auth/csrf",
                        "/api/videos",
                        "/api/videos/search/{query}",
                        "/api/videos/{videoId}",
                        "/api/videos/*/comments"
                ).permitAll()
                .anyRequest().authenticated()
            )
            .logout(logout -> logout
                .logoutRequestMatcher(logoutRequest)
                .deleteCookies("JSESSIONID")
                .logoutSuccessHandler(new HttpStatusReturningLogoutSuccessHandler(HttpStatus.NO_CONTENT))
            )
            .oauth2Login(oauth2 -> oauth2
                .successHandler(googleLoginSuccessHandler)
            );
        return http.build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {

        CorsConfiguration config = new CorsConfiguration();

        config.setAllowedOrigins(List.of(
                "http://localhost:5173",
                "http://127.0.0.1:5173"
        ));

        config.setAllowedMethods(List.of(
                "GET", "POST", "PUT",
                "PATCH", "DELETE", "OPTIONS"
        ));

        config.setAllowedHeaders(List.of("*"));
        config.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source =
                new UrlBasedCorsConfigurationSource();

        source.registerCorsConfiguration("/api/**", config);
        source.registerCorsConfiguration("/auth/**", config);

        return source;
    }
}
