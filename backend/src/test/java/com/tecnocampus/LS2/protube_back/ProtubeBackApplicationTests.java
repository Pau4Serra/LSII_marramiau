
package com.tecnocampus.LS2.protube_back;

import com.tecnocampus.LS2.protube_back.services.VideoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class ProtubeBackApplicationTests {

    @Autowired
    private VideoService videoService;

    @Test
    void shouldStartApp() {
        assertNotNull(videoService);
    }
}
