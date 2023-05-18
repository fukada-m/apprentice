# ステップ2作業手順
1. データベースの構築方法
- dockerをインストールします。
- [環境構築作業手順](https://www.notion.so/Ruby-PostgreSQL-3146f41cd91148b4b0a4ab29d509f7d9?pvs=4)これを元にdocker-composeを使用してPostgreSQLとRubyのコンテナを作成します。
- docker exec -it postgres /bin/bash
2. テーブルの構築方法
- docker exec -it postgres /bin/bash PostgreSQLのコンテナに入ります。
- PostgreSQLのコンテナで[create_table.sql](../../../docker/internetTV/src/postgres/sql/create_table.sql)を実行します。
3. サンプルデータの入力方法
- PostgreSQLのコンテナで[insert_data_chatGPT.sql](../../../docker/internetTV/src/postgres/sql/insert_data_chatGPT.sql)を実行します。