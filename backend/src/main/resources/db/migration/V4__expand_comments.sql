ALTER TABLE comment
    ADD COLUMN author_id UUID,
    ADD COLUMN author_display_name VARCHAR(255) NOT NULL,
    ADD COLUMN content TEXT NOT NULL,
    ADD COLUMN parent_id UUID,
    ADD COLUMN created_at TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    ADD COLUMN imported_like_count BIGINT NOT NULL DEFAULT 0;

ALTER TABLE comment
    ADD CONSTRAINT fk_comment_author
        FOREIGN KEY (author_id) REFERENCES users (id),
    ADD CONSTRAINT fk_comment_parent
        FOREIGN KEY (parent_id) REFERENCES comment (id) ON DELETE CASCADE;

CREATE INDEX idx_comment_video_parent_created_at
    ON comment (video_id, parent_id, created_at DESC);

CREATE TABLE comment_like (
    id UUID PRIMARY KEY,
    comment_id UUID NOT NULL,
    user_id UUID NOT NULL,
    created_at TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    CONSTRAINT fk_comment_like_comment
        FOREIGN KEY (comment_id) REFERENCES comment (id) ON DELETE CASCADE,
    CONSTRAINT fk_comment_like_user
        FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT uk_comment_like_comment_user UNIQUE (comment_id, user_id)
);
