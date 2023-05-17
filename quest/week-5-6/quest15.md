# 実行計画を確認できる

## 1. 実行計画

SQL における実行計画とは何か、実行計画を確認すると何が良いのか、SQL 初心者にわかるように説明してください。

A. 実行計画とはDBMSが最も効率的な方法でクエリを実行するための計画。
実行計画を確認することでクエリが遅い理由やインデックスが適切に使われているかを判断できます。

## 2. 実行計画の確認

次のクエリの実行計画を確認してください。

```sql
SELECT * FROM salaries WHERE salary = 70575;
```

A.  
```sql
EXPLAIN SELECT * FROM salaries WHERE salary = 70575;
```

## 3. 実行時間

次のクエリの、最初の行・全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。なお、EXPLAIN ANALYZE ステートメントを利用することで確認できます。

```sql
SELECT * FROM salaries WHERE salary = 70575;
```

A.
```sql
EXPLAIN ANALYZE SELECT * FROM salaries WHERE salary = 70575;
```

## 4. 高速なクエリ

次のクエリの実行計画及び全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。

```sql
SELECT * FROM salaries WHERE emp_no = 10100;
```

このクエリは3のクエリよりも実行時間が短いはずです。なぜこのクエリの方が高速なのかを説明してください。

A. WHERE句で使われているemp_no列にはINDEXが作られているからです。そして主キーには最初から自動でインデックスが作成されています。