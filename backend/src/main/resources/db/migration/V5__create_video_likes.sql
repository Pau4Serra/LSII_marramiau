CREATE TABLE video_like (
    id UUID PRIMARY KEY,
    video_id UUID NOT NULL REFERENCES video (id),
    user_id UUID NOT NULL REFERENCES users (id),
    CONSTRAINT uk_video_like_video_user UNIQUE (video_id, user_id)
);

CREATE INDEX idx_video_like_user ON video_like (user_id);
