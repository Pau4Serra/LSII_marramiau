CREATE TABLE users (
    id UUID PRIMARY KEY,
    google_subject VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    lastname VARCHAR(255),
    picture_url VARCHAR(2048),
    created_at TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    updated_at TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    removed_at TIMESTAMP(6) WITH TIME ZONE
);

CREATE TABLE tag (
    id UUID PRIMARY KEY
);

CREATE TABLE video (
    id UUID PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    duration INTEGER NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    video_url VARCHAR(255) NOT NULL,
    channel_id UUID NOT NULL,
    view_count BIGINT NOT NULL,
    like_count INTEGER NOT NULL,
    upload_date TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    removed_date TIMESTAMP(6) WITH TIME ZONE,
    CONSTRAINT fk_video_channel
        FOREIGN KEY (channel_id) REFERENCES users (id)
);

CREATE TABLE comment (
    id UUID PRIMARY KEY,
    video_id UUID NOT NULL,
    CONSTRAINT fk_comment_video
        FOREIGN KEY (video_id) REFERENCES video (id)
);

CREATE TABLE video_categories (
    video_id UUID NOT NULL,
    category VARCHAR(255) NOT NULL,
    CONSTRAINT fk_video_categories_video
        FOREIGN KEY (video_id) REFERENCES video (id)
);

CREATE TABLE video_tags (
    video_id UUID NOT NULL,
    tag_id UUID NOT NULL,
    CONSTRAINT pk_video_tags
        PRIMARY KEY (video_id, tag_id),
    CONSTRAINT fk_video_tags_video
        FOREIGN KEY (video_id) REFERENCES video (id),
    CONSTRAINT fk_video_tags_tag
        FOREIGN KEY (tag_id) REFERENCES tag (id)
);
