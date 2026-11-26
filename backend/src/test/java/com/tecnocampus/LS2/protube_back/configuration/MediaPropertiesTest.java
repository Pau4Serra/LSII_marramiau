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
    void developmentSeparatesTheLocalOriginFromTheOciOrigin() {
        runner.withPropertyValues("spring.profiles.active=dev").run(context -> {
            var environment = context.getEnvironment();
            assertThat(environment.getRequiredProperty("pro_tube.media.mode")).isEqualTo("local");
            assertThat(environment.getRequiredProperty("pro_tube.media.base-url")).isEqualTo("https://remote.example");
            assertThat(environment.getRequiredProperty("pro_tube.media.local.base-url")).isEqualTo("http://localhost:8080");
        });
    }

    @Test
    void developmentCanUseOciWithoutChangingDatabaseProfile() {
        runner.withPropertyValues("spring.profiles.active=dev", "ENV_PROTUBE_MEDIA_MODE=oci")
                .run(context -> assertThat(context.getEnvironment().getRequiredProperty("pro_tube.media.mode"))
                        .isEqualTo("oci"));
    }

    @Test
    void localOriginCanBeOverriddenIndependently() {
        runner.withPropertyValues("spring.profiles.active=dev", "ENV_PROTUBE_LOCAL_MEDIA_URL=http://127.0.0.1:8080")
                .run(context -> assertThat(context.getEnvironment().getRequiredProperty("pro_tube.media.local.base-url"))
                        .isEqualTo("http://127.0.0.1:8080"));
    }

    @Test
    void productionCanAlsoUseLocalStorageAndDefaultsToItsOwnPort() {
        runner.withPropertyValues("spring.profiles.active=prod").run(context -> {
            assertThat(context.getEnvironment().getRequiredProperty("pro_tube.media.mode")).isEqualTo("local");
            assertThat(context.getEnvironment().getRequiredProperty("pro_tube.media.local.base-url"))
                    .isEqualTo("http://localhost:8090");
        });
    }
}
