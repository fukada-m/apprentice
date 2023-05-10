-- create table Shohin
-- (shohin_id CHAR(4) NOT NULL,
-- shohin_mei VARCHAR(100) NOT NULL,
-- shohin_bunrui VARCHAR(32) NOT NULL,
-- hanbai_tanka INTEGER,
-- shiire_tanka INTEGER,
-- tourokubi DATE,
-- PRIMARY KEY(shohin_id) 
-- );

-- BEGIN TRANSACTION;

-- insert into Shohin VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');
-- insert into Shohin VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
-- insert into Shohin VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);
-- insert into Shohin VALUES ('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');
-- insert into Shohin VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');
-- insert into Shohin VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20');
-- insert into Shohin VALUES ('0007', 'おろしがね', 'キッチン用品', 880, 790, '2009-04-28');
-- insert into Shohin VALUES ('0008', 'ボールペン', '事務用品', 100, NULL, '2009-11-11');

-- COMMIT;

-- create table Jyushoroku (
--     toroku_bango INT not null,
--     name VARCHAR(128) not NULL,
--     jyusho VARCHAR(256) not null,
--     tell_no CHAR(10),
--     mail_address CHAR(20)
-- );
-- ALTER TABLE Jyushoroku ADD COLUMN yubin_bango CHAR(8) NOT NULL;
-- 
-- SELECT shohin_id AS "ID", shohin_mei AS "商品名", shiire_tanka AS "仕入単価"
-- FROM shohin;

-- SELECT shohin_id AS "ID", 'ぱちぱち' AS misaki
-- FROM Shohin;

-- SELECT shohin_mei, hanbai_tanka, (hanbai_tanka +100) * 2 AS "hanbai_tanka_x2"
-- FROM Shohin;

-- SELECT DISTINCT shohin_mei, hanbai_tanka, shiire_tanka
-- from shohin
-- WHERE hanbai_tanka - shiire_tanka > 500;



-- SELECT shohin_mei, tourokubi
-- FROM Shohin
-- WHERE tourokubi > '2009-04-28';

-- select shohin_mei, hanbai_tanka, shiire_tanka
-- from shohin
-- where NOT shiire_tanka < 500;

-- select shohin_mei, hanbai_tanka, shiire_tanka
-- from shohin
-- where  shiire_tanka > 500 AND shiire_tanka = 500;


-- SELECT shohin_mei, shohin_bunrui, hanbai_tanka * 0.9 - shiire_tanka AS rieki
-- FROM Shohin
-- WHERE hanbai_tanka * 0.9  - shiire_tanka > 100
-- AND (shohin_bunrui = '事務用品'or shohin_bunrui = 'キッチン用品');

-- SELECT shohin_mei
-- FROM Shohin
-- WHERE shiire_tanka IS NULL;


-- SELECT  shohin_bunrui AS "分類", max(hanbai_tanka), 'ぱっち' AS "ぱちぱち"
-- FROM Shohin
-- GROUP by shohin_bunrui

-- SELECT max(shiire_tanka), shohin_bunrui AS "分類"
-- FROM Shohin
-- where hanbai_tanka > 500
-- GROUP BY shohin_bunrui -- "分類"は使えない


-- SELECT shohin_bunrui , COUNT(*)
-- FROM Shohin
-- GROUP BY shohin_bunrui
-- HAVING COUNT(*) = 2

-- SELECT shohin_bunrui , COUNT(*)
-- FROM Shohin
-- GROUP BY shohin_bunrui
-- -- HAVING COUNT(*) = 2
-- HAVING shohin_bunrui = '衣服'

-- WITH max_prices AS (
--   SELECT
--     shohin_bunrui,
--     MAX(hanbai_tanka) AS max_hanbai_tanka
--   FROM
--     Shohin
--   GROUP BY
--     shohin_bunrui
-- )
-- SELECT
--   s.shohin_bunrui,
--   s.shohin_mei,
--   s.hanbai_tanka
-- FROM
--   Shohin s
-- JOIN
--   max_prices mp ON s.shohin_bunrui = mp.shohin_bunrui AND s.hanbai_tanka = mp.max_hanbai_tanka
-- ORDER BY
--   s.shohin_bunrui;


-- SELECT shohin_mei AS "商品名", hanbai_tanka AS "単価"
-- FROM Shohin
-- ORDER BY  "単価" DESC

-- shohin_idが使えない
-- WHEREの位置

-- SELECT shohin_bunrui, sum(hanbai_tanka), sum(shiire_tanka)
-- FROM Shohin
-- GROUP BY shohin_bunrui
-- HAVING sum(hanbai_tanka) > sum(shiire_tanka) * 1.5

-- tourokubi DESC


-- CREATE TABLE Shohins
-- (shohin_id CHAR(4) NOT NULL,
-- shohin_mei VARCHAR(100) NOT NULL,
-- shohin_bunrui VARCHAR(32) NOT NULL,
-- hanbai_tanka INTEGER DEFAUlt 0,
-- shiire_tanka INTEGER,
-- tourokubi DATE,
-- PRIMARY KEY(shohin_id) 

-- );

-- SELECT * 
-- FROM Shohin;


-- ALTER TABLE Shohins RENAME TO ShohinIns;
-- INSERT INTO ShohinIns VALUES ('0001', 'Tシャツ', '衣服', '1000', 500, '2009-09-20');
-- INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui) VALUES('2', 'ぱっち', '人')
-- INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, shiire_tanka) VALUES('3', 'ぱっちっぱ', '人', NULL)
-- SELECT * FROM ShohinIns


-- CREATE TABLE ShohinBunrui
-- (shohin_id CHAR(4) NOT NULL,
-- shohin_mei VARCHAR(100) NOT NULL,
-- shohin_bunrui VARCHAR(32) NOT NULL,
-- hanbai_tanka INTEGER DEFAUlt 0,
-- shiire_tanka INTEGER,
-- tourokubi DATE,
-- PRIMARY KEY(shohin_id) );

-- INSERT INTO ShohinCopy (hanbai_tanka, shohin_id, shohin_mei, shohin_bunrui)
-- SELECT shiire_tanka, shohin_id, shohin_mei, shohin_bunrui
-- FROM Shohin;

-- SELECT *
-- from ShohinCopy;

-- drop table ShohinCopy;

-- CREATE TABLE ShohinBunrui
-- (shohin_bunrui VARCHAR(32) NOT NULL,
-- sum_hanbai_tanka INTEGER,
-- sum_shiire_tanka INTEGER,
-- PRIMARY KEY (shohin_bunrui)
-- );

-- INSERT INTO ShohinBunrui (shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
-- SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
-- FROM Shohin
-- GROUP BY shohin_bunrui;

-- select *
-- FROM ShohinBunrui;
-- INSERT INTO ShohinBunrui VALUES('009');

-- DELETE FROM Shohin
-- WHERE hanbai_tanka >= 4000;


-- UPDATE Shohin
-- SET tourokubi = '2009-10-10';


-- UPDATE Shohin
-- SET tourokubi =  NULL
-- WHERE shohin_id = '0008';

-- UPDATE Shohin
-- SET hanbai_tanka = hanbai_tanka * 10,
-- 		shiire_tanka = shiire_tanka / 2
-- WHERE shohin_bunrui = 'キッチン用品';

-- BEGIN TRANSACTION;

-- UPDATE ShohinCopy
-- SET hanbai_tanka = 200
-- WHERE shohin_mei = 'フォーク';

-- Update;

-- UPDATE ShohinCopy
-- SET hanbai_tanka = 100,
--     shiire_tanka = 30
-- WHERE shohin_mei = 'ボールペン';

-- SELECT *
-- FROM ShohinCopy;

-- COMMIT;

-- 空
-- 上手くいく

-- Insert into ShohinSaeki (shohin_id, shohinmei, hanbai_tanka, shiire_tanka, saeki)
-- SELECT shohin_id, shohinmei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
-- from Shohin;



-- BEGIN TRANSACTION;

-- UPDATE shohin
-- SET hanbai_tanka = 3000
-- WHERE shohin_mei = 'カッターシャツ';

-- UPDATE shohin
-- SET saeki = habai_tanka - shiiretanka
-- WHERE shohin_mei = 'カッターシャツ';

-- commit;

-- DELETE FROM Shohin;

-- SELECT *
-- FROM Shohin;

-- CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
-- AS
-- SELECT shohin_bunrui, COUNT(*)
-- FROM Shohin
-- GROUP BY shohin_bunrui;

-- SELECT *
-- FROM ShohinSum;

-- SELECT *
-- FROM ShohinSum;

-- CREATE VIEW ShohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka)
-- AS
-- select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka
-- FROM Shohin
-- WHERE shohin_bunrui = '事務用品';

-- INSERT into ShohinJim VALUES('0009', '印鑑', '事務用品', 95);

-- update SHohin
-- set shiire_tanka = 10,
--     tourokubi = '2009-11-30'
-- WHERE shohin_mei = '印鑑';

-- delete FROM shohinjim WHERE shohin_id = '0009';

-- select *
-- FROM Shohin;

-- CREATE VIEW Pati (pati)
-- AS 
-- SELECT shohin_mei
-- FROM shohinJim
-- where hanbai_tanka > 200;

-- SELECT*
-- from Pati;

-- DROP VIEW ShohinJim cascade;


-- SELECT shohin_bunrui, cnt_shohin
-- FROM (SELECT shohin_bunrui, count(*)AS cnt_shohin
--         FROM Shohin
--         GROUP by shohin_bunrui) AS Shohin_count;

-- SELECT shohin_id, shohin_mei, hanbai_tanka
-- FROM Shohin
-- WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
--                       FROM Shohin );


-- SELECT shohin_bunrui, shohin_mei, hanbai_tanka
-- FROM Shohin AS S1
-- WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
--                       FROM Shohin AS S2
--                       WHERE S1.shohin_bunrui = S2.shohin_bunrui
--                       GROUP BY shohin_bunrui);

-- CREATE VIEW ViewRenshu5_1(shohin_mei, hanbai_tanka, tourokubi)
-- AS
-- SELECT shohin_mei, hanbai_tanka, tourokubi
-- FROM Shohin
-- WHERE hanbai_tanka >= 1000 AND tourokubi = '2009-09-20';

-- SELECT * 
-- FROM ViewRenshu5_1;

-- ok

-- SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, (SELECT AVG(hanbai_tanka) 
--                                                             FROM Shohin )AS hanbai_tanka_all
-- FROM Shohin;

-- DROP VIEW AvgTankaByBunrui;

-- CREATE VIEW AvgTankaByBunrui
-- AS
-- SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, (SELECT AVG(hanbai_tanka)
--                                                             FROM Shohin AS S1
--                                                             WHERE S1.shohin_bunrui = s2.shohin_bunrui
--                                                                GROUP BY shohin_bunrui ) AS avg_hanbai_tanka
-- FROM Shohin AS S2;

-- select * 
-- from AvgTankaByBunrui;
-- CREATE TABLE SampleMath
-- (m numeric (10, 3),
--  n INTEGER,
--  p INTEGER);

--  BEGIN TRANSACTION;
--  INSERT INTO SampleMath VALUES (500, 0 , NULL);
--  INSERT INTO SampleMath VALUES (-180, 0, null);
--  INSERT INTO SampleMath VALUES (null, null, null);
--  INSERT INTO SampleMath VALUES (null, 7, 3);
--  INSERT INTO SampleMath VALUES (null, 5, 2);
--  INSERT INTO SampleMath VALUES (null, 4, null);
--  INSERT INTO SampleMath VALUES (8, null, 3);
--  INSERT INTO SampleMath VALUES (2.27, 1, null);
--  INSERT INTO SampleMath VALUES (5.555, 2, null);
--  INSERT INTO SampleMath VALUES (null, 1, null);
--  INSERT INTO SampleMath VALUES (8.76, null, null);

--  COMMIT;

--  select *
--  from SampleMath;

-- SELECT m, n, round(m, n ) AS round_col
-- FROM SampleMath;

-- CREATE TABLE SampleStr
-- (
--     str1 VARCHAR(40),
--     str2 VARCHAR(40),
--     str3 VARCHAR(40)
-- );
-- BEGIN TRANSACTION;
-- INSERT INTO SAMPLEstr VALUES('あいう', 'えお', null);
-- INSERT INTO SAMPLEstr VALUES('abc', 'def', NULL);
-- INSERT INTO SAMPLEstr VALUES('山田', '太郎', 'です');
-- INSERT INTO SAMPLEstr VALUES('aaa', null, null);
-- INSERT INTO SAMPLEstr VALUES(null, 'あああ', null);
-- INSERT INTO SAMPLEstr VALUES('@!#$%', null, null);
-- INSERT INTO SAMPLEstr VALUES('ABC', null, null);
-- INSERT INTO SAMPLEstr VALUES('abc', null, null);
-- INSERT INTO SAMPLEstr VALUES('abc太郎', 'abc', 'ABC');
-- INSERT INTO SAMPLEstr VALUES('abcdefabc', 'abc', 'ABC');
-- INSERT INTO SAMPLEstr VALUES('ミックマック', 'ツ', 'つ');
-- COMMIT;

-- SELECT * 
-- FROM SampleStr;

-- select str1, str2,str3 ,upper(str1), upper(str2), lower(str3)
-- FROM SampleStr;

-- select CURRENT_DATE;

-- SELECT CURRENT_TIMESTAMP,
--         EXTRACT( YEAR FROM CURRENT_TIMESTAMP) AS year,
--         EXTRACT( MONTH FROM CURRENT_TIMESTAMP) AS month,
--         EXTRACT( DAY FROM CURRENT_TIMESTAMP) AS day,
--         EXTRACT( HOUR FROM CURRENT_TIMESTAMP) AS hour,
--         EXTRACT( MINUTE FROM CURRENT_TIMESTAMP) AS minute,
--         EXTRACT( SECOND FROM CURRENT_TIMESTAMP) AS second


-- SELECT CAST(shohin_id AS INTEGER), shohin_mei
-- FROM Shohin;

-- SELECT  COALESCE(shiire_tanka, 0 )AS "仕入れ単価"
-- FROM Shohin;
-- SELECT *
-- FROM Shohin
-- WHERE shohin_mei LIKE '%パ%';

-- SELECT *
-- FROM Shohin
-- WHERE shiire_tanka NOT IN (320, 500, 5000);


-- CREATE TABLE TenpoShohin
-- (
--     tenpo_id CHAR(4) NOT NULL,
--     tenpo_mei VARCHAR(200) NOT NULL,
--     shohin_id CHAR(4) NOT NULL,
--     suryo INTEGER NOT NULL,
--     PRIMARY KEY (tenpo_id, shohin_id)
-- );


-- BEGIN TRANSACTION;
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000A', '東京', '0001',30 );
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000A', '東京', '0002',50 );
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000A', '東京', '0003', 15);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000B', '名古屋', '0002',30 );
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000B', '名古屋', '0003', 120);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000B', '名古屋', '0004', 20);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000B', '名古屋', '0006', 10);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000B', '名古屋', '0007', 40);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000C', '大阪', '0003', 20);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000C', '大阪', '0004', 50);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000C', '大阪', '0006', 90);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000C', '大阪', '0007', 70);
-- INSERT INTO TenpoShohin (tenpo_id, tenpo_mei, shohin_id, suryo) VALUES('000D', '福岡', '0001', 100);
-- COMMIT;


-- SELECT shohin_mei , hanbai_tanka
-- FROM Shohin
-- WHERE shohin_id IN(SELECT shohin_id
--                    FROM TenpoShohin
--                    WHERE tenpo_id = '000C'
--                    );

-- SELECT * 
-- FROM shohin;
-- SELECT *
-- from tenposhohin;

-- select shohin_mei, hanbai_tanka
-- FROM Shohin AS S
-- WHERE EXISTS (SELECT * 
--               FROM TenpoShohin AS TS
--               WHERE TS.tenpo_id = '000C'
--               AND TS.shohin_id = S.shohin_id   );

-- SELECT shohin_mei, 
--         CASE WHEN shohin_bunrui = '衣服'
--             THEN 'A:'|| shohin_bunrui
--             WHEN shohin_bunrui = '事務用品'
--             THEN 'B' || shohin_bunrui
--             WHEN shohin_bunrui = 'キッチン用品'
--             THEN 'C' || shohin_bunrui
--             ELSE NULL
--         END AS abc_shohin_bunrui
--     FROM Shohin;

-- SELECT SUM(CASE WHEN shohin_bunrui = '衣服'
--                 THEN hanbai_tanka ELSE 0 END) AS sum_tanka_ihuku,
--        SUM(CASE WHEN shohin_bunrui = 'キッチン用品'
--                 THEN hanbai_tanka ELSE 0 END) AS sum_tanka_kitchen,
--        SUM(CASE WHEN shohin_bunrui = '事務用品'
--                 THEN hanbai_tanka ELSE 0 END) AS sum_tanka_jimu
-- FROM Shohin;

-- SELECT shohin_bunrui, SUM(hanbai_tanka)
-- FROM shohin
-- GROUP BY shohin_bunrui

-- 500,2800, 5000以外の商品が表示される
-- 500,2800, 5000とNULL以外の商品が表示される
-- 
-- SELECT COUNT (CASE WHEN hanbai_tanka <= 1000
--                     THEN hanbai_tanka ELSE NULL END) AS low_price, 
--         COUNT(CASE WHEN hanbai_tanka > 1000 AND hanbai_tanka <= 3000
--                     THEN hanbai_tanka ELSE NULL END) AS mid_price, 
--         COUNT(CASE WHEN hanbai_tanka > 3000
--                     THEN hanbai_tanka ELSE NULL END) AS high_price
-- FROM Shohin;
select * 
from Shohin
 