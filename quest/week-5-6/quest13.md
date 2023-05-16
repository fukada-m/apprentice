# サブクエリを使うことができる

## 1. サブクエリ

従業員番号が10001から10010のうち、全給与レコードの平均給与より給与が大きいレコードの従業員番号と給与を、サブクエリを使用して取得してください。

A. 

SELECT E.emp_no, S.salary<br>
  FROM employees AS E INNER JOIN salaries AS S<br>
    ON E.emp_no = S.emp_no<br>
 WHERE E.emp_no BETWEEN 10001 AND 10010<br>
   AND S.salary >= (SELECT AVG(salary)<br>
                      FROM salaries );

## 2. 重複なし

平均の2倍以上の給与をもらっている従業員の従業員番号を重複なく取得してください。

A.

SELECT DISTINCT E.emp_no<br>
  FROM employees AS E INNER JOIN salaries AS S<br> 
    ON E.emp_no = S.emp_no<br>
 WHERE S.salary > ( ( SELECT AVG(salary)<br>
                        FROM Salaries ) * 2 );

## ３. 最大給与

従業員番号が10001から10010のうち、全給与レコードの平均給与より給与が大きい従業員の従業員番号と最大給与を取得してください。

A.

SELECT E.emp_no, MAX(S.salary) AS max_salary <br>
  FROM employees AS E INNER JOIN salaries AS S <br>
    ON E.emp_no = S.emp_no <br>
 WHERE E.emp_no BETWEEN 10001 AND 10010 <br>
   AND S.salary > ( SELECT AVG(salary) <br>
                      FROM Salaries ) <br>
 GROUP BY E.emp_no <br>

## 4. 相関サブクエリ

従業員のうち、性別ごとに最高年齢の従業員の性別、従業員番号、誕生日を、相関サブクエリを使用して取得してください。

A.

SELECT emp_no, gender, birth_date <br>
  FROM employees AS E1 <br>
 WHERE (E1.gender, birth_date) IN (SELECT E2.gender, MIN(birth_date) <br>
                                     FROM employees AS E2 <br>
                                    WHERE E1.gender = E2.gender <br>
                                    GROUP BY E2.gender ); 

## 5. 一番若い従業員

従業員番号10100から10200の従業員の中で、それぞれの性別で最も若い年齢の人の性別、誕生日、従業員番号、ファーストネーム、ラストネームを取得してください。

A.

SELECT emp_no, gender, <br>
       CONCAT( EXTRACT( MONTH  FROM birth_date) , '/',  EXTRACT( DAY  FROM birth_date) ) AS birth_date, <br>
       first_name, last_name <br> 
  FROM employees AS E1 <br>
 WHERE emp_no BETWEEN 10100 AND 10200 <br>
   AND birth_date = (SELECT MIN(birth_date) <br>
                       FROM employees AS E2 <br>
                      WHERE E2.emp_no BETWEEN 10100 AND 10200 <br>
                        AND E1.gender = E2.gender)