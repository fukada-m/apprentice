## テーブル：tv_program
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|air_time|timestamp||PRIMARY|||
|channel_id|int||PRIMARY||
|title_id|int||||

- 外部キー制約：
    - channnel_idに対して、channelsテーブルのchannel_idカラムから設定
    - title_idに対して、titlesテーブルのtitle_idカラムから設定

## テーブル：tv_program_details
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int||PRIMARY|||
|genre_id|int||PRIMARY|||
|program_detail|varchar(100)|||||

- 外部キー制約：
    - title_idに対して、titlesテーブルのtitle_idカラムから設定
    - grenre_idに対して、genreテーブルのgenre_idカラムから設定

## テーブル：episodes
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int||PRIMARY|||
|season_num|int||PRIMARY|||
|episode_num|int||PRIMARY|||
|episode_detail|varchar(100)||||
|video_time|time|||||
|publication_date|date|||||
|views|int||INDEX|0||

- 外部キー制約：
    - title_idに対して、titlesテーブルのtitle_idカラムから設定
    - episode_details_idに対して、episode_detailsテーブルのepisode_details_idカラムから設定

## テーブル：channels
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|channel_id|int||PRIMARY||YES|
|channel_name|varchar(32)||INDEX|||

- ユニークキー制約：channel_nameカラムに設定

## テーブル：titles
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int||PRIMARY||YES|
|title_name|varchar(100)||INDEX|||

- ユニークキー制約：title_nameカラムに設定

## テーブル：genres
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|genre_id|int||PRIMARY||YES|
|genre_name|varchar(32)||INDEX||

- ユニークキー制約：genre_nameカラムに設定

