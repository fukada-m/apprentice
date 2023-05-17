# サブクエリを使うことができる

## 1. サブクエリ

従業員番号が10001から10010のうち、全給与レコードの平均給与より給与が大きいレコードの従業員番号と給与を、サブクエリを使用して取得してください。

A. 
```sql
SELECT E.emp_no, S.salary
  FROM employees AS E INNER JOIN salaries AS S
    ON E.emp_no = S.emp_no
 WHERE E.emp_no BETWEEN 10001 AND 10010
   AND S.salary >= (SELECT AVG(salary)
                      FROM salaries );
```

## 2. 重複なし

平均の2倍以上の給与をもらっている従業員の従業員番号を重複なく取得してください。

A.
```sql
SELECT DISTINCT E.emp_no
  FROM employees AS E INNER JOIN salaries AS S 
    ON E.emp_no = S.emp_no
 WHERE S.salary > ( ( SELECT AVG(salary)
                        FROM Salaries ) * 2 );
```

## ３. 最大給与

従業員番号が10001から10010のうち、全給与レコードの平均給与より給与が大きい従業員の従業員番号と最大給与を取得してください。

A.
```sql
SELECT E.emp_no, MAX(S.salary) AS max_salary 
  FROM employees AS E INNER JOIN salaries AS S 
    ON E.emp_no = S.emp_no 
 WHERE E.emp_no BETWEEN 10001 AND 10010 
   AND S.salary > ( SELECT AVG(salary) 
                      FROM Salaries ) 
 GROUP BY E.emp_no 
```

## 4. 相関サブクエリ

従業員のうち、性別ごとに最高年齢の従業員の性別、従業員番号、誕生日を、相関サブクエリを使用して取得してください。

A.
```sql
CREATE VIEW view_min_birth_date ( min_birth_date, gender )
AS
SELECT MIN(birth_date), gender
  FROM employees 
 GROUP BY gender;

SELECT emp_no, gender, birth_date 
  FROM employees AS E
 WHERE birth_date IN (SELECT min_birth_date
                        FROM view_min_birth_date AS V
                        WHERE E.birth_date = V.min_birth_date
                        AND E.gender = V.gender)
                        ORDER BY E.gender, E.emp_no; 
```

## 5. 一番若い従業員

従業員番号10100から10200の従業員の中で、それぞれの性別で最も若い年齢の人の性別、誕生日、従業員番号、ファーストネーム、ラストネームを取得してください。

A.
```sql
SELECT emp_no, gender, 
       CONCAT( EXTRACT( MONTH  FROM birth_date) , '/',  EXTRACT( DAY  FROM birth_date) ) AS birth_date, 
       first_name, last_name  
  FROM employees AS E1 
 WHERE emp_no BETWEEN 10100 AND 10200 
   AND birth_date = (SELECT MIN(birth_date) 
                       FROM employees AS E2 
                      WHERE E2.emp_no BETWEEN 10100 AND 10200 
                        AND E1.gender = E2.gender)
```