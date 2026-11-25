CREATE TABLE video_tag_labels (
    video_id UUID NOT NULL REFERENCES video (id) ON DELETE CASCADE,
    label VARCHAR(100) NOT NULL,
    PRIMARY KEY (video_id, label)
);
