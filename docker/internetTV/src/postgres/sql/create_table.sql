
BEGIN TRANSACTION;

CREATE TABLE episodes(
    episode_id SERIAL PRIMARY KEY,
    season_num INTEGER ,
    episode_num INTEGER,
    episode VARCHAR(50),
    episode_detail VARCHAR(100),
    video_time TIME,
    publication_date DATE,
    views INTEGER DEFAULT 0
);

CREATE TABLE broadcast_times(
    broadcast_time_id SERIAL PRIMARY KEY,
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

CREATE TABLE channels(
    channel_id SERIAL PRIMARY KEY,
    channel_name VARCHAR(32) UNIQUE
);

CREATE TABLE titles(
    title_id SERIAL PRIMARY KEY,
    title_name VARCHAR(100) UNIQUE
);

CREATE TABLE genres(
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(32) UNIQUE
);

CREATE TABLE tv_program_list(
    PRIMARY KEY(broadcast_time_id, channel_id),
    broadcast_time_id INTEGER,
    channel_id INTEGER,
    title_id INTEGER,
    FOREIGN KEY (broadcast_time_id) REFERENCES broadcast_times(broadcast_time_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE title_episode(
    PRIMARY KEY(title_id, episode_id),
    title_id INTEGER,
    episode_id INTEGER,
    FOREIGN KEY (title_id) REFERENCES titles(title_id),
    FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);

CREATE TABLE title_genre(
    PRIMARY KEY(title_id, genre_id),
    title_id INTEGER,
    genre_id INTEGER,
    FOREIGN KEY (title_id) REFERENCES titles(title_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);



CREATE INDEX channel_idx ON channels(channel_name);
CREATE INDEX title_idx ON titles(title_name);
CREATE INDEX genre_idx ON genres(genre_name);
CREATE INDEX episode_idx ON episodes(episode);

COMMIT;





