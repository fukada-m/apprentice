BEGIN TRANSACTION;

INSERT INTO channels  VALUES ( 1, 'Drama' );
INSERT INTO channels  VALUES ( 2, 'Anime' );

COMMIT;

BEGIN TRANSACTION;

INSERT INTO genres  VALUES ( 1, 'ドラマ' );
INSERT INTO genres  VALUES ( 2, 'アニメ' );
INSERT INTO genres  VALUES ( 3, 'スポーツ' );
INSERT INTO genres  VALUES ( 4, 'コメディ' );
INSERT INTO genres  VALUES ( 5, 'アクション' );
INSERT INTO genres  VALUES ( 6, 'ロマンス' );
INSERT INTO genres  VALUES ( 7, 'ミステリー' );
INSERT INTO genres  VALUES ( 8, 'バラエティ' );
INSERT INTO genres  VALUES ( 9, 'サイエンス' );
INSERT INTO genres  VALUES ( 10, 'ニュース' );

COMMIT;