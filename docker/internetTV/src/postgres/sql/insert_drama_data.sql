BEGIN TRANSACTION;

-- 星の探究者　シーズン1 12話
INSERT INTO titles VALUES 
(6, '星の探求者 # 1~12', '宇宙を舞台に、主人公たちが未知の星々を探索する冒険の旅を描いたSFドラマ。');

INSERT INTO episodes VALUES 
(61, 1, 1, '新たなる旅立ち', '主人公たちが地球を出発し、宇宙へと旅立つ', '00:60:00', '2023-01-01', 1200),
(62, 1, 2, '初めての星', '主人公たちが初めての星を探索し、困難に直面する', '00:60:00', '2023-01-08', 1150),
(63, 1, 3, '謎の信号', '主人公たちが未知の星からの謎の信号を解析する', '00:60:00', '2023-01-15', 1180),
(64, 1, 4, 'エイリアンの謎', 'エイリアンの存在に気づいたクルーが彼らと接触を試みる', '00:60:00', '2023-01-22', 1120),
(65, 1, 5, '星間の危機', '船が技術的な故障に見舞われ、乗組員がその解決策を見つけ出さなければならない', '00:60:00', '2023-01-29', 1190),
(66, 1, 6, '新たな世界', '乗組員が惑星に着陸し、新たな生物を発見する', '00:60:00', '2023-02-05', 1140),
(67, 1, 7, '対立', 'クルーの間に意見の対立が生じ、団結が試される', '00:60:00', '2023-02-12', 1200),
(68, 1, 8, '帰還の道', '故郷への帰還方法を見つけるために、クルーが一緒に働く', '00:60:00', '2023-02-19', 1160),
(69, 1, 9, '遠い記憶', '遠くの地球に思いを馳せる乗組員たち', '00:60:00', '2023-02-26', 1180),
(70, 1, 10, 'コンタクト', 'エイリアンの種族との最初の接触', '00:60:00', '2023-03-05', 1130),
(71, 1, 11, '共存', '異なる種族との共存の可能性とそれがもたらす困難を描く', '00:60:00', '2023-03-12', 1150),
(72, 1, 12, '新たな旅', 'クルーが新たな旅へと出発し、シーズンを締めくくる', '00:60:00', '2023-03-19', 1200);

INSERT INTO title_episode VALUES
(6, 61),
(6, 62),
(6, 63),
(6, 64), 
(6, 65), 
(6, 66), 
(6, 67), 
(6, 68), 
(6, 69), 
(6, 70), 
(6, 71), 
(6, 72);

INSERT INTO title_genre VALUES ( 6, 1);
INSERT INTO title_genre VALUES ( 6, 6);
INSERT INTO title_genre VALUES ( 6, 9);

COMMIT;

BEGIN TRANSACTION;

-- 星の探究者　シーズン2  12話
INSERT INTO titles VALUES 
(7, '星の探求者: シーズン2 #1~12', '新たな星々、新たな冒険。クルーが宇宙を更に深く探求する。');

INSERT INTO episodes VALUES 
(73, 2, 1, '新たなる挑戦', 'シーズン2のスタート。未知の領域への新たな挑戦が始まる', '00:60:00', '2023-04-02', 1200),
(74, 2, 2, '宇宙の海賊', '未知の領域で遭遇した宇宙の海賊との戦い', '00:60:00', '2023-04-09', 1150),
(75, 2, 3, '失われた星', '古代の文明の痕跡を発見する', '00:60:00', '2023-04-16', 1180),
(76, 2, 4, '歴史の謎', '失われた星の文明の秘密を解明する', '00:60:00', '2023-04-23', 1120),
(77, 2, 5, '新たな仲間', '新たな仲間とともに旅を続ける', '00:60:00', '2023-04-30', 1190),
(78, 2, 6, '星間戦争', '異なる星間文明間の戦争に巻き込まれる', '00:60:00', '2023-05-07', 1140),
(79, 2, 7, '和平の使者', '戦争を止めるための和平交渉', '00:60:00', '2023-05-14', 1200),
(80, 2, 8, '勇者の戦い', '主人公たちが星間戦争の中で勇気を示す', '00:60:00', '2023-05-21', 0),
(81, 2, 9, '希望の光', '絶望的な状況の中で希望の光を見つける', '00:60:00', '2023-05-28', 0),
(82, 2, 10, '和平への道', '和平を達成するための困難な道のり', '00:60:00', '2023-06-04', 0),
(83, 2, 11, '終わりなき旅', '和平が達成され、新たな旅への道が開かれる', '00:60:00', '2023-06-11', 0),
(84, 2, 12, '星の海へ', '未来への希望とともに新たな星へ', '00:60:00', '2023-06-18', 0);

INSERT INTO title_episode VALUES ( 7, 73 );
INSERT INTO title_episode VALUES ( 7, 74 );
INSERT INTO title_episode VALUES ( 7, 75 );
INSERT INTO title_episode VALUES ( 7, 76 );
INSERT INTO title_episode VALUES ( 7, 77 );
INSERT INTO title_episode VALUES ( 7, 78 );
INSERT INTO title_episode VALUES ( 7, 79 );
INSERT INTO title_episode VALUES ( 7, 80 );
INSERT INTO title_episode VALUES ( 7, 81 );
INSERT INTO title_episode VALUES ( 7, 82 );
INSERT INTO title_episode VALUES ( 7, 83 );
INSERT INTO title_episode VALUES ( 7, 84 );

INSERT INTO title_genre VALUES ( 7, 1);
INSERT INTO title_genre VALUES ( 7, 6);
INSERT INTO title_genre VALUES ( 7, 9);

COMMIT;

BEGIN TRANSACTION;

-- 時間の旅人　シーズン1 12話
INSERT INTO titles VALUES 
(8, '時間の旅人 # 1~12', '主人公が時間旅行を通じて歴史の重要な出来事を経験し、過去や未来から現在を救う物語。');

INSERT INTO episodes VALUES 
(85, 1, 1, '時の始まり', '主人公が初めて時間旅行の能力に目覚める', '00:60:00', '2023-04-01', 1200),
(86, 1, 2, '過去への旅', '主人公が中世ヨーロッパに旅行し、歴史的な事件に遭遇', '00:60:00', '2023-04-08', 1150),
(87, 1, 3, '未来からの警告', '未来からの謎のメッセージと遭遇', '00:60:00', '2023-04-15', 1180),
(88, 1, 4, 'タイムパラドックス', '主人公が過去の自分と出会い、時間のパラドックスに直面する', '00:60:00', '2023-04-22', 1120),
(89, 1, 5, '未来の世界', '主人公が未来の都市を訪れ、驚くべき技術を目の当たりにする', '00:60:00', '2023-04-29', 1190),
(90, 1, 6, '歴史の修正', '主人公が歴史の流れを修正するために奮闘', '00:60:00', '2023-05-06', 1140),
(91, 1, 7, '時間の迷子', '主人公が時間の流れの中で迷い、帰還の道を探す', '00:60:00', '2023-05-13', 1200),
(92, 1, 8, '友情を超えて時間', '主人公が時間を越えて失われた友人を救う', '00:60:00', '2023-05-20', 0),
(93, 1, 9, 'タイムトラベルの倫理', '時間旅行の能力の倫理的な問題を描く', '00:60:00', '2023-05-27', 0),
(94, 1, 10, '過去からのレッスン', '主人公が過去の教訓から学ぶ', '00:60:00', '2023-06-03', 0),
(95, 1, 11, '時間の終わり', '時間旅行の能力が危険にさらされる', '00:60:00', '2023-06-10', 0),
(96, 1, 12, '新たな始まり', '主人公が新たな冒険に向けて旅立つ', '00:60:00', '2023-06-17', 0);

INSERT INTO title_episode VALUES 
(8, 85),
(8, 86),
(8, 87),
(8, 88), 
(8, 89), 
(8, 90), 
(8, 91), 
(8, 92), 
(8, 93), 
(8, 94), 
(8, 95), 
(8, 96);

INSERT INTO title_genre VALUES ( 8, 1);
INSERT INTO title_genre VALUES ( 8, 4);
INSERT INTO title_genre VALUES ( 8, 6);

COMMIT;

BEGIN TRANSACTION;

-- 魔法と運命の織りなす物語 シーズン1 12話
INSERT INTO titles VALUES 
(9, '魔法と運命の織りなす物語 # 1~12', 'ファンタジー世界を舞台に、若き魔法使いの成長と彼の運命に立ち向かう勇気を描いた物語。');

INSERT INTO episodes VALUES 
(97, 1, 1, '魔法の覚醒', '主人公が魔法の力に目覚める', '00:60:00', '2022-07-01', 1200),
(98, 1, 2, '師匠との出会い', '主人公が魔法使いの師匠と出会う', '00:60:00', '2022-07-08', 1150),
(99, 1, 3, '初めての試練', '主人公が初めての魔法の試練に挑む', '00:60:00', '2022-07-15', 1180),
(100, 1, 4, '運命の予言', '主人公が自身の運命についての予言を聞く', '00:60:00', '2022-07-22', 1120),
(101, 1, 5, '魔法の森の冒険', '主人公が魔法の森での冒険を体験', '00:60:00', '2022-07-29', 1190),
(102, 1, 6, '闇の魔法使い', '主人公が闇の魔法使いと対峙する', '00:60:00', '2022-08-05', 1140),
(103, 1, 7, '運命の転換', '主人公が自身の運命を変える決断をする', '00:60:00', '2022-08-12', 1200),
(104, 1, 8, '真実の魔法', '主人公が真実の魔法の力を理解する', '00:60:00', '2022-08-19', 1160),
(105, 1, 9, '師匠の秘密', '主人公が師匠の秘密を知る', '00:60:00', '2022-08-26', 1180),
(106, 1, 10, '最終決戦', '主人公が闇の魔法使いとの最終決戦に向かう', '00:60:00', '2022-09-02', 1130),
(107, 1, 11, '運命の絆', '主人公が運命との絆を強く感じる', '00:60:00', '2022-09-09', 1150),
(108, 1, 12, '新たな旅立ち', '主人公が新たな旅に出発する', '00:60:00', '2022-09-16', 1200);

-- タイトルとエピソードの関連づけ
INSERT INTO title_episode VALUES 
(9, 97),
(9, 98),
(9, 99),
(9, 100),
(9, 101),
(9, 102),
(9, 103),
(9, 104),
(9, 105),
(9, 106),
(9, 107),
(9, 108);


INSERT INTO title_genre VALUES ( 9, 1);
INSERT INTO title_genre VALUES ( 9, 4);
INSERT INTO title_genre VALUES ( 9, 5);

COMMIT;