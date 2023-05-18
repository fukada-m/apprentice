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

-- 終末のパズルマスター シーズン1 12話のデータ
BEGIN TRANSACTION;

INSERT INTO titles VALUES ( 1, '終末のパズルマスター #1~12', '知識と謎解きが求められる未来世界を舞台に、
少年パズルマスターの成長と友情の物語。複雑なパズルを解き明かし、世界を救うために奮闘します。' );

INSERT INTO episodes VALUES ( 1, 1, 1, '始まりの物語', '少年はパズルを求めて旅に出た', '00:30:00', '2023-03-01', 888);
INSERT INTO episodes VALUES ( 2, 1, 2, '解き放たれた謎', '少年は最初の大きなパズルに挑む', '00:30:00', '2023-03-08', 905);
INSERT INTO episodes VALUES ( 3, 1, 3, '友情の鍵', '新たな仲間との出会いが少年の解答に繋がる', '00:30:00', '2023-03-15', 872);
INSERT INTO episodes VALUES ( 4, 1, 4, '闇のパズル', '暗闇の中、感覚だけを頼りにパズルを解く', '00:30:00', '2023-03-22', 890);
INSERT INTO episodes VALUES ( 5, 1, 5, '過去の影', '歴史のパズルを解き、過去の真実に辿り着く', '00:30:00', '2023-03-29', 912);
INSERT INTO episodes VALUES ( 6, 1, 6, '休息の日', '仲間たちとの日常が織り成す小さなパズル', '00:30:00', '2023-04-05', 934);
INSERT INTO episodes VALUES ( 7, 1, 7, '揺れ動く思い', 'ライバルとの対決が少年の心を試す', '00:30:00', '2023-04-12', 948);
INSERT INTO episodes VALUES ( 8, 1, 8, '不可能な挑戦', 'かつてない困難なパズルが少年を待ち受ける', '00:30:00', '2023-04-19', 789);
INSERT INTO episodes VALUES ( 9, 1, 9, '新たなる力', '仲間からの助けで、少年は新たな力を手に入れる', '00:30:00', '2023-04-26', 935);
INSERT INTO episodes VALUES ( 10, 1, 10, '最後の門', 'ついに最後のパズルが現れる', '00:30:00', '2023-05-03', 826);
INSERT INTO episodes VALUES ( 11, 1, 11, '絶望と希望', '苦戦の中、少年は希望の光を見つける', '00:30:00', '2023-05-10', 820);
INSERT INTO episodes VALUES ( 12, 1, 12, 'パズルの終わり、新たなる旅', 'パズルが解け、新たな旅が始まる', '00:30:00', '2023-05-17', 733);

INSERT INTO title_episode VALUES ( 1, 1 );
INSERT INTO title_episode VALUES ( 1, 2 );
INSERT INTO title_episode VALUES ( 1, 3 );
INSERT INTO title_episode VALUES ( 1, 4 );
INSERT INTO title_episode VALUES ( 1, 5 );
INSERT INTO title_episode VALUES ( 1, 6 );
INSERT INTO title_episode VALUES ( 1, 7 );
INSERT INTO title_episode VALUES ( 1, 8 );
INSERT INTO title_episode VALUES ( 1, 9 );
INSERT INTO title_episode VALUES ( 1, 10 );
INSERT INTO title_episode VALUES ( 1, 11 );
INSERT INTO title_episode VALUES ( 1, 12 );
INSERT INTO title_genre VALUES (1, 2);
INSERT INTO title_genre VALUES (1, 4);
INSERT INTO title_genre VALUES (1, 7);

COMMIT;

BEGIN TRANSACTION;

--ドラゴンの伝説　シーズン1 12話
INSERT INTO titles VALUES ( 2, 'ドラゴンの伝説 #1~12', '異世界に生きるドラゴンと少年の絆を描いた冒険ファンタジー。
未知の力と友情を通じて、彼らは世界のバランスを保つために戦います。' );

INSERT INTO episodes VALUES ( 13, 1, 1, '竜の覚醒', '少年とドラゴンの初めての出会い', '00:30:00', '2023-01-08', 988);
INSERT INTO episodes VALUES ( 14, 1, 2, '未知への旅立ち', '新たな世界への冒険が始まる', '00:30:00', '2023-01-15', 1050);
INSERT INTO episodes VALUES ( 15, 1, 3, '勇者の証', '試練を乗り越え、少年は勇者となる', '00:30:00', '2023-01-22', 1023);
INSERT INTO episodes VALUES ( 16, 1, 4, '古代の秘密', '古代のドラゴンと人間の歴史を探る', '00:30:00', '2023-01-29', 978);
INSERT INTO episodes VALUES ( 17, 1, 5, '闇の力の誘惑', '邪悪な力によって友情が試される', '00:30:00', '2023-02-05', 956);
INSERT INTO episodes VALUES ( 18, 1, 6, '幻のドラゴン', '幻想的なドラゴンとの遭遇', '00:30:00', '2023-02-12', 1001);
INSERT INTO episodes VALUES ( 19, 1, 7, '失われた王国', '失われたドラゴンの王国を探す', '00:30:00', '2023-02-19', 1024);
INSERT INTO episodes VALUES ( 20, 1, 8, '心の絆', '心を通わせ、共に戦う力を見つける', '00:30:00', '2023-02-26', 1035);
INSERT INTO episodes VALUES ( 21, 1, 9, '炎の試練', 'ドラゴンの力と人間の知恵で試練に挑む', '00:30:00', '2023-03-05', 988);
INSERT INTO episodes VALUES ( 22, 1, 10, '宿敵の影', '闇の力の主が姿を現す', '00:30:00', '2023-03-12', 994);
INSERT INTO episodes VALUES ( 23, 1, 11, '最終決戦へ', '全ての力を結集し、最終決戦へ', '00:30:00', '2023-03-19', 1005);
INSERT INTO episodes VALUES ( 24, 1, 12, '伝説の終わり、新たな始まり', '戦いが終わり、新たな旅が始まる', '00:30:00', '2023-03-26', 0);

INSERT INTO title_episode VALUES ( 2, 1 );
INSERT INTO title_episode VALUES ( 2, 2 );
INSERT INTO title_episode VALUES ( 2, 3 );
INSERT INTO title_episode VALUES ( 2, 4 );
INSERT INTO title_episode VALUES ( 2, 5 );
INSERT INTO title_episode VALUES ( 2, 6 );
INSERT INTO title_episode VALUES ( 2, 7 );
INSERT INTO title_episode VALUES ( 2, 8 );
INSERT INTO title_episode VALUES ( 2, 9 );
INSERT INTO title_episode VALUES ( 2, 10 );
INSERT INTO title_episode VALUES ( 2, 11 );
INSERT INTO title_episode VALUES ( 2, 12 );

INSERT INTO title_genre VALUES ( 2, 2 );
INSERT INTO title_genre VALUES ( 2, 5 );
INSERT INTO title_genre VALUES ( 2, 6 );

COMMIT;


-- メカニカルシティ　シーズン1 12話
BEGIN TRANSACTION;

INSERT INTO titles VALUES ( 3, 'メカニカルシティ #1~12', '巨大なメカと科学の力を駆使して、未来都市を救う若者たちの壮大な物語。
機械と人間の共存と対立を描きます。' );

INSERT INTO episodes VALUES ( 25, 1, 1, '鋼鉄の街', '超高層ビルが立ち並ぶ未来都市の風景を紹介', '00:30:00', '2023-01-08', 1288);
INSERT INTO episodes VALUES ( 26, 1, 2, 'ギアと夢', 'メカニックとしての夢を抱いた少年の物語が始まる', '00:30:00', '2023-01-15', 1342);
INSERT INTO episodes VALUES ( 27, 1, 3, '初めての挑戦', '初めての修理を任された少年の奮闘', '00:30:00', '2023-01-22', 1309);
INSERT INTO episodes VALUES ( 28, 1, 4, '暗闇からの呼び声', '深夜のビルの中、謎のメカに遭遇', '00:30:00', '2023-01-29', 1275);
INSERT INTO episodes VALUES ( 29, 1, 5, '裏切りと友情', '友情を試す困難が二人を待つ', '00:30:00', '2023-02-05', 1259);
INSERT INTO episodes VALUES ( 30, 1, 6, '都市の心臓', '巨大なエネルギーコアを修理するために奮闘', '00:30:00', '2023-02-12', 1300);
INSERT INTO episodes VALUES ( 31, 1, 7, '影との戦い', '謎の組織からの襲撃', '00:30:00', '2023-02-19', 1319);
INSERT INTO episodes VALUES ( 32, 1, 8, '逆襲の準備', '友人たちと力を合わせて作戦を練る', '00:30:00', '2023-02-26', 1307);
INSERT INTO episodes VALUES ( 33, 1, 9, '最強のメカ', '友人たちと一緒に作った自作のメカで逆襲', '00:30:00', '2023-03-05', 1360);
INSERT INTO episodes VALUES ( 34, 1, 10, '絆の証明', '友情の力で困難を乗り越える', '00:30:00', '2023-03-12', 1377);
INSERT INTO episodes VALUES ( 35, 1, 11, '未来への扉', '新たな技術を手に入れ、未来への扉が開く', '00:30:00', '2023-03-19', 1400);
INSERT INTO episodes VALUES ( 36, 1, 12, '新たなる夢', '一つの冒険が終わり、次なる夢が始まる', '00:30:00', '2023-03-26', 0);

INSERT INTO title_episode VALUES ( 3, 1 );
INSERT INTO title_episode VALUES ( 3, 2 );
INSERT INTO title_episode VALUES ( 3, 3 );
INSERT INTO title_episode VALUES ( 3, 4 );
INSERT INTO title_episode VALUES ( 3, 5 );
INSERT INTO title_episode VALUES ( 3, 6 );
INSERT INTO title_episode VALUES ( 3, 7 );
INSERT INTO title_episode VALUES ( 3, 8 );
INSERT INTO title_episode VALUES ( 3, 9 );
INSERT INTO title_episode VALUES ( 3, 10 );
INSERT INTO title_episode VALUES ( 3, 11 );
INSERT INTO title_episode VALUES ( 3, 12 );

INSERT INTO title_genre VALUES ( 3, 2);
INSERT INTO title_genre VALUES ( 3, 5);
INSERT INTO title_genre VALUES ( 3, 9);

COMMIT;

-- 幽霊退治団 シーズン1 12話
BEGIN TRANSACTION;

INSERT INTO titles VALUES ( 4, '幽霊退治団 #1~12', '現代社会で暮らす平凡な高校生が、幽霊との奇妙な遭遇をきっかけに、
自分たちだけの退治団を結成。コミカルかつスリリングな日々を描きます。' );

INSERT INTO episodes VALUES ( 37, 1, 1, '不思議な呼び声', '退治団の日常と彼らの特異な能力を紹介', '00:30:00', '2022-09-03', 1250);
INSERT INTO episodes VALUES ( 38, 1, 2, '怨念の家', '初めての依頼先は呪われた家', '00:30:00', '2022-09-10', 1300);
INSERT INTO episodes VALUES ( 39, 1, 3, '光と影', 'メンバーの過去とその能力が明かされる', '00:30:00', '2022-09-17', 1320);
INSERT INTO episodes VALUES ( 40, 1, 4, '彷徨う魂', '迷える魂を救うために奮闘', '00:30:00', '2022-09-24', 1345);
INSERT INTO episodes VALUES ( 41, 1, 5, '仲間割れ', '仲間内の対立が退治の邪魔をする', '00:30:00', '2022-10-01', 1350);
INSERT INTO episodes VALUES ( 42, 1, 6, '友情と和解', '対立を乗り越えて絆を深める', '00:30:00', '2022-10-08', 1380);
INSERT INTO episodes VALUES ( 43, 1, 7, '呪われた街', '全体を覆う巨大な怨念に挑む', '00:30:00', '2022-10-15', 1400);
INSERT INTO episodes VALUES ( 44, 1, 8, '解放の儀式', '退治団の全力で怨念を浄化', '00:30:00', '2022-10-22', 1420);
INSERT INTO episodes VALUES ( 45, 1, 9, '突然の襲撃', '未知の敵からの攻撃に遭う', '00:30:00', '2022-10-29', 1450);
INSERT INTO episodes VALUES ( 46, 1, 10, '新たな力', '新たな力を手に入れて立ち向かう', '00:30:00', '2022-11-05', 1475);
INSERT INTO episodes VALUES ( 47, 1, 11, '最終戦', '全ての力を結集して敵に立ち向かう', '00:30:00', '2022-11-12', 1500);
INSERT INTO episodes VALUES ( 48, 1, 12, '和解と新たな挑戦', '戦いが終わり、新たな挑戦が待っている', '00:30:00', '2022-11-19', 0);

INSERT INTO title_episode VALUES ( 4, 1 );
INSERT INTO title_episode VALUES ( 4, 2 );
INSERT INTO title_episode VALUES ( 4, 3 );
INSERT INTO title_episode VALUES ( 4, 4 );
INSERT INTO title_episode VALUES ( 4, 5 );
INSERT INTO title_episode VALUES ( 4, 6 );
INSERT INTO title_episode VALUES ( 4, 7 );
INSERT INTO title_episode VALUES ( 4, 8 );
INSERT INTO title_episode VALUES ( 4, 9 );
INSERT INTO title_episode VALUES ( 4, 10 );
INSERT INTO title_episode VALUES ( 4, 11 );
INSERT INTO title_episode VALUES ( 4, 12 );

INSERT INTO title_genre VALUES ( 4, 2);
INSERT INTO title_genre VALUES ( 4, 4);
INSERT INTO title_genre VALUES ( 4, 7);

COMMIT;

BEGIN TRANSACTION;

INSERT INTO broadcast_times values (1, '2023-05-18 00:00:00', '2023-05-18 06:00:00' );
INSERT INTO broadcast_times values (2, '2023-05-18 06:00:00', '2023-05-18 12:00:00' );
INSERT INTO broadcast_times values (3, '2023-05-18 12:00:00', '2023-05-18 18:00:00' );
INSERT INTO broadcast_times values (4, '2023-05-18 18:00:00', '2023-05-18 24:00:00' );

COMMIT;

BEGIN TRANSACTION;

INSERT INTO tv_program_list VALUES(1, 2, 1);
INSERT INTO tv_program_list VALUES(2, 2, 2);
INSERT INTO tv_program_list VALUES(3, 2, 3);
INSERT INTO tv_program_list VALUES(4, 2, 4);

COMMIT;