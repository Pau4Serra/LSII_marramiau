package com.tecnocampus.LS2.protube_back;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.test.context.ActiveProfiles;
import javax.sql.DataSource;
import java.util.UUID;
import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest(showSql = false)
@ActiveProfiles("dev")
class SeedSqlTest {
    private static final UUID VIDEO = UUID.fromString("d36554d2-29ee-54b3-8dd7-04150a7ce9eb");
    private static final UUID CHANNEL = UUID.fromString("61e5d627-6e41-5965-a65a-4e5c7512b08f");
    @Autowired DataSource dataSource;
    private JdbcTemplate jdbc;

    @BeforeEach
    void setUp() {
        jdbc = new JdbcTemplate(dataSource);
    }

    private void seed() {
        var populator = new ResourceDatabasePopulator(new ClassPathResource("seed-test.sql"));
        populator.setSqlScriptEncoding("UTF-8");
        populator.execute(dataSource);
    }

    @Test
    void generatedSqlRunsTwiceAndPreservesRelationshipsAndSpecialCharacters() {
        seed();
        seed();
        assertEquals(1, jdbc.queryForObject("SELECT COUNT(*) FROM video WHERE id = ?", Integer.class, VIDEO));
        assertEquals(CHANNEL, jdbc.queryForObject("SELECT channel_id FROM video WHERE id = ?", UUID.class, VIDEO));
        assertEquals("L'estiu 🎬", jdbc.queryForObject("SELECT title FROM video WHERE id = ?", String.class, VIDEO));
        assertEquals("Primera línia;\nD'ara \\ després", jdbc.queryForObject("SELECT description FROM video WHERE id = ?", String.class, VIDEO));
        assertEquals(3_000_000_000L, jdbc.queryForObject("SELECT view_count FROM video WHERE id = ?", Long.class, VIDEO));
        assertEquals(2, jdbc.queryForObject("SELECT COUNT(*) FROM video_categories WHERE video_id = ?", Integer.class, VIDEO));
        assertEquals(1, jdbc.queryForObject("SELECT COUNT(*) FROM comment WHERE video_id = ?", Integer.class, VIDEO));
        assertEquals("Molt bé!\n'Hola'; \\ món", jdbc.queryForObject("SELECT content FROM comment WHERE video_id = ?", String.class, VIDEO));
        assertEquals("L'Anna", jdbc.queryForObject("SELECT author_display_name FROM comment WHERE video_id = ?", String.class, VIDEO));
        assertNull(jdbc.queryForObject("SELECT author_id FROM comment WHERE video_id = ?", UUID.class, VIDEO));
        assertEquals(5L, jdbc.queryForObject("SELECT imported_like_count FROM comment WHERE video_id = ?", Long.class, VIDEO));
    }

    @Test
    void neverOverwritesExistingRowsOrReactivatesRemovedVideos() {
        seed();
        jdbc.update("UPDATE video SET title = ?, status = 'REMOVED' WHERE id = ?", "Edited", VIDEO);
        jdbc.update("UPDATE users SET name = ? WHERE id = ?", "Edited channel", CHANNEL);
        jdbc.update("DELETE FROM video_categories WHERE video_id = ?", VIDEO);
        jdbc.update("DELETE FROM comment WHERE video_id = ?", VIDEO);
        seed();
        assertEquals("Edited", jdbc.queryForObject("SELECT title FROM video WHERE id = ?", String.class, VIDEO));
        assertEquals("REMOVED", jdbc.queryForObject("SELECT status FROM video WHERE id = ?", String.class, VIDEO));
        assertEquals("Edited channel", jdbc.queryForObject("SELECT name FROM users WHERE id = ?", String.class, CHANNEL));
        assertEquals(0, jdbc.queryForObject("SELECT COUNT(*) FROM video_categories WHERE video_id = ?", Integer.class, VIDEO));
        assertEquals(0, jdbc.queryForObject("SELECT COUNT(*) FROM comment WHERE video_id = ?", Integer.class, VIDEO));
    }
}
