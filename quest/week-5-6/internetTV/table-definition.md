## テーブル：TVprogram_list
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|broadcast_time_id|int||PRIMARY|||
|channel_id|int||PRIMARY||
|title_id|int||||

- 外部キー制約：
    - broadcast_time_idに対して、broadcast_timesテーブルのbroadcast_time_idカラムに設定
    - channnel_idに対して、channelsテーブルのchannel_idカラムから設定
    - title_idに対して、titlesテーブルのtitle_idカラムから設定

## テーブル:title-episode
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int||PRIMARY|||
|episode_id|int||PRIMARY|||
- 外部キー制約
    - title_idに対して、titlesテーブルのtitle_idカラムから設定
    - episode_idに対して、episodesテーブルのepisode_idカラムから設定

## テーブル：title-genre
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int||PRIMARY|||
|genre_id|int||PRIMARY|||

- 外部キー制約：
    - title_idに対して、titlesテーブルのtitle_idカラムから設定
    - grenre_idに対して、genresテーブルのgenre_idカラムから設定

## テーブル：episodes
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|episode_id|int||PRIMARY||YES|
|season_num|int|||||
|episode_num|int|||||
|episode|varchar(50)|||||
|episode_detail|varchar(100)||||
|video_time|time|||||
|publication_date|date|||||
|views|int||INDEX|0||


## テーブル:broadcast_times
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|broadcast_time_id|int||PRIMARY|||
|start_time|timestanp|||||
|end_time|timestamp|||||


## テーブル：channels
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|channel_id|int||PRIMARY||YES|
|channel|varchar(32)||INDEX|||

- ユニークキー制約：channelカラムに設定

## テーブル：titles
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int||PRIMARY||YES|
|title|varchar(50)||INDEX|||
|title_detail|varchar(100)|||||

- ユニークキー制約：titleカラムに設定

## テーブル：genres
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|genre_id|int||PRIMARY||YES|
|genre|varchar(32)||INDEX||

- ユニークキー制約：genreカラムに設定

