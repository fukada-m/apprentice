module CreateTableSql
    def create_table_episodes
        "CREATE TABLE episodes(
            episode_id SERIAL PRIMARY KEY,
            season_num INTEGER ,
            episode_num INTEGER,
            episode VARCHAR(50),
            episode_detail VARCHAR(100),
            video_time TIME,
            publication_date DATE,
            views INTEGER DEFAULT 0
        );"
    end

    def create_table_times
        "CREATE TABLE broadcast_times(
            broadcast_time_id SERIAL PRIMARY KEY,
            start_time TIMESTAMP,
            end_time TIMESTAMP
        );"
    end

    def create_table_channels
        "CREATE TABLE channels(
            channel_id SERIAL PRIMARY KEY,
            channel VARCHAR(32) UNIQUE
        );"
    end

    def create_table_titles
        "CREATE TABLE titles(
            title_id SERIAL PRIMARY KEY,
            title VARCHAR(50) UNIQUE,
            title_detail VARCHAR(100)
        );"
    end

    def create_table_genres
    "CREATE TABLE genres(
        genre_id SERIAL PRIMARY KEY,
        genre VARCHAR(32) UNIQUE
    );"
    end

    def create_table_tv_program_list
    "CREATE TABLE tv_program_list(
        PRIMARY KEY(broadcast_time_id, channel_id),
        broadcast_time_id INTEGER,
        channel_id INTEGER,
        title_id INTEGER,
        FOREIGN KEY (broadcast_time_id) REFERENCES broadcast_times(broadcast_time_id),
        FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
        FOREIGN KEY (title_id) REFERENCES titles(title_id)
    );"
    end

    def create_table_title_episode
    "CREATE TABLE title_episode(
        PRIMARY KEY(title_id, episode_id),
        title_id INTEGER,
        episode_id INTEGER,
        FOREIGN KEY (title_id) REFERENCES titles(title_id),
        FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
    );"
    end

    def create_table_title_genre
    "CREATE TABLE title_genre(
        PRIMARY KEY(title_id, genre_id),
        title_id INTEGER,
        genre_id INTEGER,
        FOREIGN KEY (title_id) REFERENCES titles(title_id),
        FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
    );"
    end

    def create_index_channel_idx
        "CREATE INDEX channel_idx ON channels(channel);"
    end

    def create_index_title_idx
        "CREATE INDEX title_idx ON titles(title);"
    end

    def create_index_genre_idx
        "CREATE INDEX genre_idx ON genres(genre);"
    end

    def create_index_episode_idx
        "CREATE INDEX episode_idx ON episodes(episode);"
    end
end
