package com.tecnocampus.LS2.protube_back.security;

import com.tecnocampus.LS2.protube_back.model.dto.ResponseDTO.UserDTO;
import com.tecnocampus.LS2.protube_back.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;


@Component
public class GoogleLoginSuccessHandler
        extends SimpleUrlAuthenticationSuccessHandler {

    private final UserService userService;

    public GoogleLoginSuccessHandler(
            UserService userService,
            @Value("${pro_tube.auth.success-url}") String successUrl) {

        super(successUrl);
        setAlwaysUseDefaultTargetUrl(true);
        this.userService = userService;
    }

    @Override
    public void onAuthenticationSuccess(
            HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication)
            throws IOException, ServletException {

        OidcUser googleUser =
                (OidcUser) authentication.getPrincipal();

                userService.findOrCreateFromGoogle(
                googleUser.getSubject(),
                googleUser.getEmail(),
                googleUser.getGivenName(),
                googleUser.getFamilyName(),
                googleUser.getPicture()
        );

        // Redirigeix al frontend després de gestionar l'usuari.
        super.onAuthenticationSuccess(request, response, authentication);
    }

}
