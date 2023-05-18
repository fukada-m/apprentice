## テーブル：tv_program
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|air_time|date||PRIMARY|||
|channel_id|int(4)||PRIMARY||
|title_id|int(8)||PRIMARY||

- 外部キー制約：
    - channnel_idに対して、channelsテーブルのchannel_idカラムから設定
    - title_idに対して、titlesテーブルのtitle_idカラムから設定

## テーブル：tv_program_details
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int(8)||PRIMARY|||
|genre_id|int(4)||PRIMARY|||
|program_details|varchar(100)|||||

- 外部キー制約：
    - title_idに対して、titlesテーブルのtitle_idカラムから設定
    - grenre_idに対して、genreテーブルのgenre_idカラムから設定

## テーブル：episodes
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int(8)||PRIMARY|||
|season_num|int(4)||PRIMARY|||
|episode_num|int(4)||PRIMARY|||
|episode_details_id|int(8)||||



- 外部キー制約：
    - title_idに対して、titlesテーブルのtitle_idカラムから設定
    - episode_details_idに対して、episode_detailsテーブルのepisode_details_idカラムから設定

## テーブル：channnels
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|channel_id|int(4)||PRIMARY||YES|
|channnel_name|varchar(32)||INDEX|||

- ユニークキー制約：channel_nameカラムに設定

## テーブル：titles
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|title_id|int(8)||PRIMARY||YES|
|title_name|varchar||INDEX|||

- ユニークキー制約：title_nameカラムに設定

## テーブル：genres
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|genre_id|int(4)||PRIMARY||YES|
|genre_name|varchar||INDEX||

- ユニークキー制約：genre_nameカラムに設定

## テーブル：episode_details
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|episode_details_id|int(8)||PRIMARY||YES|
|episode_details|varchar(100)||||
|video_time|date|||||
|publication_date|date|||||
|views|int(8)||INDEX|0||