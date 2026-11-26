-- Generated seed: insert missing rows only; run serially after schema creation.

INSERT INTO users (id, google_subject, email, name, created_at, updated_at, dark_mode)
SELECT CAST('61e5d627-6e41-5965-a65a-4e5c7512b08f' AS UUID), 'seed-channel:61e5d627-6e41-5965-a65a-4e5c7512b08f', '61e5d627-6e41-5965-a65a-4e5c7512b08f@catalog.invalid', 'Canal d''exemple', CAST('2025-10-09T08:53:20.000000+00:00' AS TIMESTAMP WITH TIME ZONE), CAST('2025-10-09T08:53:20.000000+00:00' AS TIMESTAMP WITH TIME ZONE), FALSE
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = CAST('61e5d627-6e41-5965-a65a-4e5c7512b08f' AS UUID));

INSERT INTO video (id, title, description, duration, thumbnail, video_url, channel_id, view_count, like_count, upload_date, status)
SELECT CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID), 'L''estiu 🎬', 'Primera línia;
D''ara \ després', 13, '/media/d36554d2-29ee-54b3-8dd7-04150a7ce9eb/thumbnail.webp', '/media/d36554d2-29ee-54b3-8dd7-04150a7ce9eb/video.mp4', CAST('61e5d627-6e41-5965-a65a-4e5c7512b08f' AS UUID), 3000000000, 7, CAST('2025-10-09T08:53:20.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 'ACTIVE'
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID));

INSERT INTO video_categories (video_id, category)
SELECT CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID), 'GAMING'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID) AND category = 'GAMING') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID) AND status = 'ACTIVE');

INSERT INTO video_categories (video_id, category)
SELECT CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID), 'OTHER'
WHERE NOT EXISTS (SELECT 1 FROM video_categories WHERE video_id = CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID) AND category = 'OTHER') AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID) AND status = 'ACTIVE');

INSERT INTO comment (id, video_id, author_id, author_display_name, content, parent_id, created_at, imported_like_count)
SELECT CAST('df5be9dc-e517-5d38-9c50-08f8028570f5' AS UUID), CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID), NULL, 'L''Anna', 'Molt bé!
''Hola''; \ món', NULL, CAST('2025-10-09T08:55:00.000000+00:00' AS TIMESTAMP WITH TIME ZONE), 5
WHERE NOT EXISTS (SELECT 1 FROM comment WHERE id = CAST('df5be9dc-e517-5d38-9c50-08f8028570f5' AS UUID)) AND EXISTS (SELECT 1 FROM video WHERE id = CAST('d36554d2-29ee-54b3-8dd7-04150a7ce9eb' AS UUID) AND status = 'ACTIVE');
