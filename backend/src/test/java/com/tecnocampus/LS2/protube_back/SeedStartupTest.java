package com.tecnocampus.LS2.protube_back;

import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.test.context.ActiveProfiles;
import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest(properties = {
        "spring.datasource.url=jdbc:h2:mem:seed-startup;DB_CLOSE_DELAY=-1",
        "spring.sql.init.mode=always",
        "spring.sql.init.data-locations=classpath:seed-test.sql"
})
@ActiveProfiles("dev")
class SeedStartupTest {
    @MockBean ClientRegistrationRepository registrations;
    @Autowired VideoService videos;

    @Test
    void springAutomaticallyLoadsSqlAfterHibernateCreatesTheSchema() {
        var catalog = videos.getVideos();
        assertEquals(1, catalog.size());
        assertEquals("L'estiu 🎬", catalog.getFirst().title());
        assertEquals(3_000_000_000L, catalog.getFirst().viewsCount());
    }
}
