# データを集計できる

## 1. 列の合計値

給与情報(salaries テーブル)から、全データの給与の合計値を求めてください。

A.
```sql
SELECT SUM(salary) 
  FROM salaries;
```

## 2. 列の平均値

給与情報から、全データの給与の平均値を求めてください。

A.
```sql
SELECT AVG(salary) 
  FROM salaries;
```

## 3. 四捨五入

給与の平均値は小数点で取得されたかと思います。給与の平均値を四捨五入して整数で求めてください。

A.
```sql
SELECT ROUND(AVG(salary), 0) 
  FROM salaries;
```

## 3. 列の最大値

給与情報から、全データの給与の最大値を求めてください。

A.
```sql
SELECT MAX(salary) 
  FROM salaries;
```

## 4. 列の最小値

給与情報から、全データの給与の最小値を求めてください。

A.
```sql
SELECT MIN(salary) 
  FROM salaries;
```

## 5. 行数

給与情報から、全データの行数を求めてください。

A.
```sql
SELECT COUNT(*) 
  FROM salaries;
```

## 6. 絞り込みとの組み合わせ

from_date が1986年6月26日の従業員の最大給与を取得してください。

A.
```sql
SELECT MAX(salary) 
  FROM salaries 
 WHERE from_date = '1986-6-26'
```

## 7. 少数第1桁

to_date が1991年6月26日の従業員の平均給与を少数第1桁で取得してください。

A.
```sql
SELECT ROUND(AVG(salary), 1) 
  FROM salaries 
 WHERE to_date = '1991-6-26'
```