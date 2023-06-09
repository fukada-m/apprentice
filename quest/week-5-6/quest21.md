# テーブルを定義できる

テーブル定義では各テーブルに対して、テーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）、外部キー制約、ユニークキー制約を定義します。

## 1. データ型

データ型とは何か、データベース初心者にわかるように説明してください。

A. 使用できるデータの種類のこと。例えば数値、文字列、日付など。

## 2. NULL

NULL とは何か、データベース初心者にわかるように説明してください。

A. 特定のセルに値が存在しない、または未定義の状態であること。0や空白とは違う

## 3. プライマリーキー

プライマリーキーとは何か、データベース初心者にわかるように説明してください。

A. テーブル内のレコードを一意に識別するための一つまたは複数の列のこと

## 4. 初期値

テーブル定義における初期値(デフォルト値)とは何か、データベース初心者にわかるように説明してください。

A. 新しい行を登録する際に特定の列に自動で入力される値のこと。

## 5. AUTO INCREMENT

AUTO INCREMENT とは何か、データベース初心者にわかるように説明してください。

新しい行が追加されるたびに自動的に増加する数値を生成する特別な機能のこと。主にプライマリーキーで使用される

## 6. 外部キー制約

外部キー制約とは何か、データベース初心者にわかるように説明してください。

A. あるテーブルの列が他のテーブルの列（通常はプライマリーキー）を参照することを指定する制約。この制約により、データベースのテーブル間のリレーションシップが確立され、データの整合性が保たれる

## 7. ユニークキー制約

ユニークキー制約とは何か、データベース初心者にわかるように説明してください。

A. ユニークキー制約が設定された列においてすべの値が一意になることを保証する制約

## 8. テーブル定義

EC サイトの ER 図を、テーブル定義しましょう。各テーブルのテーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）、外部キー制約、ユニークキー制約を設定してください。

以下、アウトプット例です。

テーブル：users

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|name|varchar(100)|||||
|email|varchar(100)||INDEX|||

- ユニークキー制約：email カラムに対して設定

テーブル：comments

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|user_id|bigint(20)|YES|INDEX|0||
|content|text|||||

- 外部キー制約：user_id に対して、users テーブルの id カラムから設定

なお、アウトプットはテキストでしていただいてもよいですし、SpreadSheet 等を用いて表形式でしていただいても大丈夫です。

A. 

テーブル：purchase_history
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|order_id|int(8)||PRIMARY|||
|goods_id|int(4)||PRIMARY|||
|user_id|int(8)||PRIMARY|||
|price|int(8)|||||
|quantity|int(4)|||||

- 外部キー制約：order_idに対して、ordersテーブルのorder_idカラム
              goods_idに対して、goodsテーブルのgoods_idカラム
              user_idに対して、usersテーブルのuser_idカラム

テーブル：orders
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|order_id|int(8)||PRIMARY||YES|
|order_date|date|||||

- 外部キー制約：user_idに対して、usersテーブルのuser_idカラム

テーブル：users
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|user_id|int(8)||PRIMARY||YES|
|user_name|varchar(32)||INDEX|||

テーブル：goods
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|goods_id|int(4)||PRIMARY||YES|
|goods_name|varchar(32)||INDEX
|goods_category_id|int(4)||||
|price|int(8)|yes||||
|stock|int(4)|yes||||

- 外部キー制約：goods_category_idに対して、goods_categoryテーブルのgoods_category_idカラム

テーブル：goods_category
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|good_category_id|int(4)||PRIMARY||YES|
|goods_category_name|varchar(32)|||||


