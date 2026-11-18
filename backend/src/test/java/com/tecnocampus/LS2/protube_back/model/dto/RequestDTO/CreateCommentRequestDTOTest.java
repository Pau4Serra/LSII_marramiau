package com.tecnocampus.LS2.protube_back.model.dto.RequestDTO;

import jakarta.validation.Validation;
import jakarta.validation.Validator;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class CreateCommentRequestDTOTest {

    private static Validator validator;

    @BeforeAll
    static void setUpValidator() {
        validator = Validation.buildDefaultValidatorFactory().getValidator();
    }

    @Test
    void acceptsNonBlankContentOfAtMostOneThousandCharacters() {
        var violations = validator.validate(new CreateCommentRequestDTO("Great video!"));

        assertThat(violations).isEmpty();
    }

    @Test
    void rejectsBlankAndOverlongContent() {
        var blankViolations = validator.validate(new CreateCommentRequestDTO("   "));
        var overlongViolations = validator.validate(
                new CreateCommentRequestDTO("a".repeat(1001)));

        assertThat(blankViolations).isNotEmpty();
        assertThat(overlongViolations).isNotEmpty();
    }
}
