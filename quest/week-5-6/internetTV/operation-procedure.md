# ステップ2作業手順
1. データベースの構築方法
- dockerがインストールしてある前提になります
- [環境構築作業手順](https://www.notion.so/Ruby-PostgreSQL-3146f41cd91148b4b0a4ab29d509f7d9?pvs=4)これを元にdocker-composeを使用してPostgreSQLとRubyのコンテナを作成します。
2. テーブルの構築方法
- docker exec -it postgres /bin/bash でPostgreSQLのコンテナに入ります。
- PostgreSQLのコンテナで　psql -U fukada -d internet_tv -f create_table.sql　で[create_table.sql](../../../docker/internetTV/src/postgres/sql/create_table.sql)を実行します。
3. サンプルデータの入力方法
- PostgreSQLのコンテナで以下のSQLファイルを順に実行してサンプルデータを入力します。
    - [insert_channel_and_genre.sql](../../../docker/internetTV/src/postgres/sql/insert_channel_and_genre.sql)
    - [insert_anime_data.sql](../../../docker/internetTV/src/postgres/sql/insert_anime_data.sql)
    - [insert_drama_data.sql]
- rubyを使って5/18~5/30までランダムに番組を配置して番組表を作成します。
    - docker exec -it ruby /bin/bash　でrubyのコンテナに入ります。
    - setup_tv_program_listを実行します。