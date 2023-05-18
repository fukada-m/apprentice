BEGIN TRANSACTION;

INSERT INTO channels VALUES (1, 'アニメ');
INSERT INTO titles VALUES (1, '鬼滅');
INSERT INTO genres VALUES (1, 'アクション');

INSERT INTO channels VALUES (2, 'ドラマ');
INSERT INTO titles VALUES (2, 'ジョジョ');
INSERT INTO genres VALUES (2, 'お笑い');

INSERT INTO tv_program VALUES ('2023-05-18 21:00:00',1, 1);
INSERT INTO tv_program_details VALUES (1, 1, '面白い物語です');
INSERT INTO episodes VALUES (1, 1, 1, '始まりの物語', '00:30:00','2022-04-01', 888);

INSERT INTO tv_program VALUES ('2023-05-18 22:00:00', 1, 2);
INSERT INTO tv_program_details VALUES (2, 1, '奇妙な話です');
INSERT INTO episodes VALUES (2, 1, 1, 'スタート', '00:28:34', '2023-05-18', 0);

COMMIT;