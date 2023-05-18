
BEGIN TRANSACTION;

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

CREATE TABLE tv_program(
    PRIMARY KEY(air_time, channel_id),
    air_time TIMESTAMP,
    channel_id INTEGER,
    title_id INTEGER,
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE TABLE tv_program_details(
    PRIMARY KEY(title_id, genre_id),
    title_id INTEGER,
    genre_id INTEGER,
    program_detail VARCHAR(100),
    FOREIGN KEY (title_id) REFERENCES titles(title_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE episodes(
    PRIMARY KEY(title_id, season_num, episode_num),
    title_id INTEGER,
    season_num INTEGER ,
    episode_num INTEGER,
    episode_detail VARCHAR(100),
    video_time TIME,
    publication_date DATE,
    views INTEGER DEFAULT 0,
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

CREATE INDEX channel_name_idx ON channels(channel_name);
CREATE INDEX title_name_idx ON titles(title_name);
CREATE INDEX genre_name_idx ON genres(genre_name);

COMMIT;





