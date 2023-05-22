# ステップ2作業手順
1. データベースの構築方法
- dockerがインストールしてある前提です
- GitHubからクローンします。```git@github.com:fukada-m/apprentice.git```
- [環境構築作業手順](https://www.notion.so/Ruby-PostgreSQL-3146f41cd91148b4b0a4ab29d509f7d9?pvs=4)を元にDocker-Composeを使用してPostgreSQLとRubyのコンテナを作成します。
2. テーブルの構築方法
- ```$ docker exec -it postgres /bin/bash``` コマンドでPostgreSQLのコンテナに入ります。
- ```$ psql -U fukada -d internet_tv -f create_table.sql```コマンドで[create_table.sql](../../../docker/internetTV/src/postgres/sql/create_table.sql)を実行してテーブルを作成します。
3. サンプルデータの入力方法
- 先ほどと同じようにPostgreSQLのコンテナで以下のSQLファイルを順に実行してサンプルデータを入力します。
    - [insert_channel_and_genre.sql](../../../docker/internetTV/src/postgres/sql/insert_channel_and_genre.sql)
    - [insert_anime_data.sql](../../../docker/internetTV/src/postgres/sql/insert_anime_data.sql)
    - [insert_drama_data.sql](../../../docker/internetTV/src/postgres/sql/insert_drama_data.sql)
- rubyを使って5/18~5/30までランダムに番組を配置して番組表を作成します。その後、必要なデータがあれば取得できます。
    - ```$ docker exec -it ruby /bin/bash```　でrubyのコンテナに入ります。
    - ```bundle exec ruby ruby/<rubyファイル名>```コマンドで以下のファイルを順に実行します。
    - [setup_tv_program_list.rb](../../../docker/internetTV/src/ruby/script/setup_tv_program_list.rb)番組表が作成されます。
    - [show_all_list.rb](../../../docker/internetTV/src/ruby/script/show_all_list.rb)全ての番組表が表示されます。次に全てのタイトルとそのエピソードが表示されます。
    - [main.rb](../../../docker/internetTV/src/ruby/script/main.rb)メニューに従って必要な情報を表示できます。