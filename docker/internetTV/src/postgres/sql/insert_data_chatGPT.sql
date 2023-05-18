BEGIN TRANSACTION;

INSERT INTO channels ( channel ) VALUES ( 'AbemaNews' );
INSERT INTO channels ( channel ) VALUES ( 'AbemaAnime' );

COMMIT;

BEGIN TRANSACTION;

INSERT INTO genres ( genre ) VALUES ( 'ドラマ' );
INSERT INTO genres ( genre ) VALUES ( 'スポーツ' );
INSERT INTO genres ( genre ) VALUES ( 'コメディ' );
INSERT INTO genres ( genre ) VALUES ( 'アクション' );
INSERT INTO genres ( genre ) VALUES ( 'ロマンス' );
INSERT INTO genres ( genre ) VALUES ( 'ミステリー' );
INSERT INTO genres ( genre ) VALUES ( 'バラエティ' );
INSERT INTO genres ( genre ) VALUES ( 'サイエンス' );
INSERT INTO genres ( genre ) VALUES ( 'ニュース' );

COMMIT;

BEGIN TRANSACTION;

INSERT INTO titles ( title ,titel_detal) VALUES( '終末のパズルマスター', '知識と謎解きが求められる未来世界を舞台に、
少年パズルマスターの成長と友情の物語。複雑なパズルを解き明かし、世界を救うために奮闘します。' );

INSERT INTO titles ( title ,titel_detal) VALUES( 'ドラゴンの伝説', '異世界に生きるドラゴンと少年の絆を描いた冒険ファンタジー。未知の力と友情を通じて、彼らは世界のバランスを保つために戦います。' );

INSERT INTO titles ( title ,titel_detal) VALUES( 'メカニカルシティ', '巨大なメカと科学の力を駆使して、未来都市を救う若者たちの壮大な物語。機械と人間の共存と対立を描きます。' );

INSERT INTO titles ( title ,titel_detal) VALUES( '幽霊退治団', '現代社会で暮らす平凡な高校生が、幽霊との奇妙な遭遇をきっかけに、自分たちだけの退治団を結成。コミカルかつスリリングな日々を描きます。' );

INSERT INTO titles ( title ,titel_detal) VALUES( '時空の勇者', '時空を超えて様々なエポックに旅する少年の冒険。過去と未来の英雄たちと共に、時間の流れを歪める強大な敵と対峙します。' );

INSERT INTO titles ( title ,titel_detal) VALUES( '魔法学校の新生', '新入生の少女が魔法学校での生活を通じて友情、愛、そして自分自身の強さを発見するストーリー。繊細な描写と壮大な魔法世界を楽しむことができます。' );


COMMIT;




BEGIN TRANSACTION;


COMMIT;

BEGIN TRANSACTION;

INSERT INTO episodes VALUES (1, 1, 1, '運命の出会い', '00:45:00','2022-05-01', 10354 );
INSERT INTO episodes VALUES (1, 1, 2, '二人の道', '00:50:00','2022-05-08', 8932);
INSERT INTO episodes VALUES (1, 1, 3, '遥かなる絆', '00:55:00','2022-05-15', 12567);
INSERT INTO episodes VALUES (1, 1, 4, '時を超える愛', '00:48:00','2022-05-22',11210 );

COMMIT;