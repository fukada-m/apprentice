テーブルを作成・修正・削除できる
作成済みのデータベースを指定して MySQL に接続してください。MySQL に接続後、使用するデータベースを指定しても大丈夫です。

1. テーブルの作成
任意のテーブルを作成してください。テーブルのカラムは自由に作成してください。

A. 

CREATE TABLE Test(
  PRIMARY KEY(id),
       id INT NOT NULL,
     name VARCHAR(40) NOT NULL
);

2. テーブルの表示
テーブルが作成できたことを確認するために、テーブルの一覧を表示してください。

A. SHOW TABLES;

3. カラムの追加
作成したテーブルに、任意のカラムを一列追加してください。

A. ALTER TABLE Test ADD COLUMN (age INTEGER NOT NULL DEFAULT 0);

4. カラムの表示
カラムが追加できたことを確認するために、テーブルのカラムの一覧を表示してください。

A. DESCRIBE Test;

5. カラムの削除
追加したカラムを削除してください。削除後、削除できていることを確認してください。

A. ALTER TABLE Test DROP COLUMN age;

6. テーブルの削除
作成したテーブルを削除してください。削除後、削除できていることを確認してください。

A. DROP TABLE Test

7. テーブルの再作成
再度テーブルを作成しましょう。

今後、作成したテーブルを指定して作業します。