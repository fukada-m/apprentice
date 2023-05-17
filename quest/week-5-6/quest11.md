# テーブルを結合できる

## 1. 内部結合

部署マネージャーテーブルに、従業員テーブルのデータを内部結合させた全データを取得してください。

A.
```sql
SELECT  E.emp_no, E.birth_date, E.first_name, E.last_name, E.gender, E.hire_date, 
        D.dept_no, D.from_date, D.to_date 
  FROM employees AS E INNER JOIN dept_manager AS D 
    ON E.emp_no = D.emp_no;
```

## 2. 列の選択

部署ごとに、部署番号、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

A.
```sql
SELECT M.dept_no, D.dept_name, M.emp_no, E.first_name, E.last_name 
  FROM dept_manager AS M 
 INNER JOIN departments AS D ON D.dept_no = M.dept_no 
 INNER JOIN employees AS E ON E.emp_no = M.emp_no;
```

## 3. 複数の内部結合

部署ごとに、部署番号、部署名、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

A.
```sql
SELECT M.dept_no, D.dept_name, M.emp_no, E.first_name, E.last_name 
  FROM dept_manager AS M 
 INNER JOIN departments AS D ON D.dept_no = M.dept_no 
 INNER JOIN employees AS E ON E.emp_no = M.emp_no 
```

## 4. 絞り込み

部署ごとに、部署番号、部署名、現在のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。

A.
```sql
SELECT M.dept_no, D.dept_name, M.emp_no, E.first_name, E.last_name 
  FROM dept_manager AS M 
 INNER JOIN departments AS D ON D.dept_no = M.dept_no 
 INNER JOIN employees AS E ON E.emp_no = M.emp_no 
 WHERE M.to_date = '9999-01-01'
```

## 5. 給与

従業員番号10001から10010の従業員ごとに、ファーストネーム、ラストネーム、いつからいつまで給与がいくらだったかを取得してください。

A.
```sql
SELECT S.emp_no, E.first_name, E.last_name, S.from_date, S.to_date, S.salary 
  FROM salaries AS S INNER JOIN employees AS E 
    ON S.emp_no = E.emp_no 
 WHERE S.emp_no BETWEEN 10001 AND 10010 
```

## 6. 内部結合と外部結合の違い

INNER JOIN と OUTER JOIN の違いについて、SQL 初心者にわかるように説明してください。またどのように使い分けるのかも合わせて説明してください。

A.　INNER JOINとは結合条件に一致する行のみを結果セットに含みます。OUTER JOINは RIGHT、LEFT、FULLで指定されたテーブルの全ての行を結果セットに含みます。
そして片方のテーブルに一致する行がない場合はNULLで埋めます。
使い分け方はINNER JOINの場合は両方のテーブルに共通のデータが必要な場合、一致しないデータは結果セットに含めたくない場合、一致するデータだけを抽出したい場合などです。
OUTER JOINを使う場合は一方のテーブルのすべてのデータを取得し、もう一方のテーブルの一致するデータがあれば取得したい場合、一致しないデータも結果セットに含めたい場合などが挙げられます。