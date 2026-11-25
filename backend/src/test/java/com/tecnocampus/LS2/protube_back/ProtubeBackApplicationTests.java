
package com.tecnocampus.LS2.protube_back;

import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
@org.springframework.test.context.ActiveProfiles("dev")
class ProtubeBackApplicationTests {

    @org.springframework.boot.test.mock.mockito.MockBean
    private org.springframework.security.oauth2.client.registration.ClientRegistrationRepository registrations;

    @Autowired
    private VideoService videoService;

    @Test
    void shouldStartApp() {
        assertNotNull(videoService);
    }
}
