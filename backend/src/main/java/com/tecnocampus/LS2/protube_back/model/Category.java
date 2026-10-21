package com.tecnocampus.LS2.protube_back.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public enum Category {
    MUSIC("Music"),
    SPORTS("Sports"),
    GAMING("Gaming"),
    NEWS("News"),
    EDUCATION("Education"),
    ENTERTAINMENT("Entertainment"),
    TECHNOLOGY("Technology"),
    TRAVEL("Travel"),
    FOOD("Food"),
    FASHION("Fashion"),
    COMEDY("Comedy"),
    FILM_AND_ANIMATION("Film & Animation"),
    HOWTO_AND_STYLE("Howto & Style"),
    PEOPLE_AND_BLOGS("People & Blogs"),
    SCIENCE_AND_TECHNOLOGY("Science & Technology"),
    OTHER("Other");

    private static final Logger LOG = LoggerFactory.getLogger(Category.class);

    private final String metadataName;

    Category(String metadataName) {
        this.metadataName = metadataName;
    }

    public static Category fromMetadata(String value) {
        if (value != null) {
            String normalizedValue = value.strip();
            for (Category category : values()) {
                if (category.metadataName.equalsIgnoreCase(normalizedValue)) {
                    return category;
                }
            }
        }

        LOG.warn("Unknown video metadata category '{}'; using OTHER", value);
        return OTHER;
    }

    public static List<Category> fromMetadataList(List<String> values) {
        if (values == null) {
            return List.of();
        }

        return values.stream()
                .map(Category::fromMetadata)
                .distinct()
                .toList();
    }
}
