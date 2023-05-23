## テーブル:broadcast_times
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMARY||YES|
|start_time|timestanp|||||
|end_time|timestamp|||||

## テーブル：channels
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMARY||YES|
|name|varchar(32)|||||

- ユニークキー制約：nameカラムに設定

## テーブル：titles
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMARY||YES|
|name|varchar(50)|||||
|title_detail|varchar(100)|||||

- ユニークキー制約：nameカラムに設定

## テーブル：episodes
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMARY||YES|
|title_id|int||INDEX|||
|episode_detail_id|int||INDEX|||
- 外部キー制約：
    - title_idに対して、titlesテーブルのidカラムから設定
    - episode_detail_idに対して、episode_detailテーブルのidカラムから設定

## テーブル：episode_detail
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMARY||YES|
|season_num|int|||||
|episode_num|int|||||
|name|varchar(50)|||||
|episode_detail|varchar(100)||||
|video_time|time|||||
|publication_date|date|||||
|view|int|||0||

## テーブル：genres
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMARY||YES|
|name|varchar(32)||||

- ユニークキー制約：nameカラムに設定

## テーブル：TVprogram_list
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMARY||YES|
|broadcast_time_id|int||INDEX|||
|channel_id|int||INDEX||
|episode_id|int||INDEX||

- 外部キー制約：
    - broadcast_time_idに対して、broadcast_timesテーブルのidカラムに設定
    - channnel_idに対して、channelsテーブルのidカラムから設定
    - title_idに対して、titlesテーブルのidカラムから設定


## テーブル：title-genre
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|int||PRIMAEY||YES|
|title_id|int||INDEX|||
|genre_id|int||INDEX|||

- 外部キー制約：
    - title_idに対して、titlesテーブルのidカラムから設定
    - grenre_idに対して、genresテーブルのidカラムから設定










