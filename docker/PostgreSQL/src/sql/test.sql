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

SELECT 'ぱち' AS "ぱっち";