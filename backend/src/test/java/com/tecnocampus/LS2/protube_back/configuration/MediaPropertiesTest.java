package com.tecnocampus.LS2.protube_back.configuration;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.ConfigDataApplicationContextInitializer;
import org.springframework.boot.test.context.runner.ApplicationContextRunner;

import static org.assertj.core.api.Assertions.assertThat;

class MediaPropertiesTest {
    private final ApplicationContextRunner runner = new ApplicationContextRunner()
            .withInitializer(new ConfigDataApplicationContextInitializer())
            .withPropertyValues("ENV_PROTUBE_MEDIA_BASE_URL=https://remote.example");

    @Test
    void developmentDoesNotInheritProductionMediaUrl() {
        runner.withPropertyValues("spring.profiles.active=dev")
                .run(context -> assertThat(context.getEnvironment()
                        .getRequiredProperty("pro_tube.media.base-url"))
                        .isEqualTo("http://localhost:8080/media"));
    }

    @Test
    void developmentAllowsItsOwnOverride() {
        runner.withPropertyValues("spring.profiles.active=dev",
                        "ENV_PROTUBE_DEV_MEDIA_BASE_URL=http://127.0.0.1:8080/media")
                .run(context -> assertThat(context.getEnvironment()
                        .getRequiredProperty("pro_tube.media.base-url"))
                        .isEqualTo("http://127.0.0.1:8080/media"));
    }

    @Test
    void productionStillUsesRemoteMediaUrl() {
        runner.withPropertyValues("spring.profiles.active=prod")
                .run(context -> assertThat(context.getEnvironment()
                        .getRequiredProperty("pro_tube.media.base-url"))
                        .isEqualTo("https://remote.example"));
    }
}
