# 条件分岐ができる

## 1. CASE

従業員番号10100から10200の従業員に対して、最終在籍日に応じて在籍中か離職済みかを出し分けたいです。従業員番号、最終在籍日 (to_date)、在職状況(employed/unemployed) を、CASE 式を使用して表示してください。

A.

SELECT emp_no, MAX(to_date) AS last_day_of_residence, <br>
  CASE WHEN MAX(to_date) = '9999-01-01' <br>
       THEN 'unemployed' <br>
       ELSE 'employed' <br>
       END AS "employ" <br>
  FROM salaries <br>
 WHERE emp_no BETWEEN 10100 AND 10200 <br>
 GROUP BY emp_no;

## 2. 年代

従業員番号が10001から10050の従業員を対象に、従業員番号、誕生日、年代を表示してください。なお年代は、誕生日が1950年代の場合「50s」、誕生日が1960年代の場合「60s」と表記してください。

A. 

SELECT emp_no, birth_date, <br>
  CASE WHEN birth_date LIKE '195%' <br>
       THEN '50s' <br>
       WHEN birth_date LIKE '196%' <br>
       THEN '60s' <br>
       ELSE NULL <br>
   END AS generation <br>
  FROM employees <br>
 WHERE emp_no BETWEEN 10001 AND 10050; 

## 3. 年代ごとの最大給与

年代ごとの最大給与を取得してください。なお年代は、誕生日が1950年代の場合「50s」、誕生日が1960年代の場合「60s」と表記してください。

A. 

SELECT MAX(CASE WHEN EXTRACT( YEAR FROM birth_date) BETWEEN 1950 AND 1959 <br>
                THEN salary <br>
                ELSE 0 END ) AS max_salary_50s, <br>
       MAX(CASE WHEN EXTRACT( YEAR FROM birth_date) BETWEEN 1960 AND 1969 <br>
                THEN salary <br>
                ELSE 0 END ) AS max_salary_60s <br>
  FROM employees AS E INNER JOIN salaries AS S <br>
    ON E.emp_no = S.emp_no