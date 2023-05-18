BEGIN TRANSACTION;

INSERT INTO channels ( channel_name ) VALUES ( 'AbemaNews' );
INSERT INTO channels ( channel_name ) VALUES ( 'AbemaSports' );
INSERT INTO channels ( channel_name ) VALUES ( 'AbemaDrama' );
INSERT INTO channels ( channel_name ) VALUES ( 'AbemaAnime' );
INSERT INTO channels ( channel_name ) VALUES ( 'AbemaVariety' );

COMMIT;


BEGIN TRANSACTION;

INSERT INTO titles ( title_name ) VALUES( 'ドラマシティ' );
INSERT INTO titles ( title_name ) VALUES( 'スポーツマスター' );
INSERT INTO titles ( title_name ) VALUES( 'コメディライブ' );
INSERT INTO titles ( title_name ) VALUES( 'アクションヒーローズ' );
INSERT INTO titles ( title_name ) VALUES( '恋愛物語' );
INSERT INTO titles ( title_name ) VALUES( 'ミステリーズ' );
INSERT INTO titles ( title_name ) VALUES( '冒険の旅' );
INSERT INTO titles ( title_name ) VALUES( 'バラエティ王' );
INSERT INTO titles ( title_name ) VALUES( 'サイエンスワールド' );
INSERT INTO titles ( title_name ) VALUES( 'ファッションクイーン' );

COMMIT;


BEGIN TRANSACTION;

INSERT INTO genre ( genre_name ) VALUES ( 'ドラマ' );
INSERT INTO genre ( genre_name ) VALUES ( 'スポーツ' );
INSERT INTO genre ( genre_name ) VALUES ( 'コメディ' );
INSERT INTO genre ( genre_name ) VALUES ( 'アクション' );
INSERT INTO genre ( genre_name ) VALUES ( 'ロマンス' );
INSERT INTO genre ( genre_name ) VALUES ( 'ミステリー' );
INSERT INTO genre ( genre_name ) VALUES ( 'バラエティ' );
INSERT INTO genre ( genre_name ) VALUES ( 'サイエンス' );
INSERT INTO genre ( genre_name ) VALUES ( 'ファッション' );

COMMIT;


BEGIN TRANSACTION;

INSERT INTO tv_program_details VALUES (1, 1, 'ドラマシティは、感動的なストーリーと演技によって視聴者の心を揺さぶる、
感動系ドラマの集まりです。毎回異なる舞台とキャストを持つエピソードをお届けし、人間ドラマの魅力に浸ることができます。');
INSERT INTO tv_program_details VALUES (2, 2, 'スポーツマスターは、スポーツ愛好家に向けた情報とエンターテイメントが満載の番組です。
各種競技の最新ニュースや試合ハイライト、選手のインタビューなど、スポーツ界のトピックスを幅広くカバーしています。');
INSERT INTO tv_program_details VALUES (3, 3, 'コメディライブは、笑いとユーモアに満ちたエンターテイメント番組です。
一流のコメディアンたちが繰り広げる即興劇やコント、視聴者参加型の笑いのミッションなど、楽しさ溢れるコメディパフォーマンスをお届けします。');
INSERT INTO tv_program_details VALUES (4, 4, 'アクションヒーローズは、スリリングなアクションシーンとヒーローたちの勇敢な冒険を描いた番組です。
強力な敵との戦い、壮大なスケールのバトル、そしてヒーローたちの成長と絆に感動することができます。');
INSERT INTO tv_program_details VALUES (5, 5, '恋愛物語は、胸キュンとドキドキが詰まったロマンティックなストーリーをお届けする番組です。
恋に落ちる喜びや切なさ、恋人たちの成長や困難を通じて、愛の力と人間の心の美しさを描きます。');
INSERT INTO tv_program_details VALUES (6, 6, 'ミステリーズは、謎と推理が魅力の番組です。
鋭い観察力と推理力を持つ主人公たちが、犯罪や事件の真相を解明していく様子を描きます。
視聴者は謎解きに興奮し、驚きとスリルに満ちたストーリーに引き込まれることでしょう。');
INSERT INTO tv_program_details VALUES (7, 7, '冒険の旅は、遥かなる未知の世界への冒険を追体験できる番組です。
探検家や冒険者たちが未踏の地を訪れ、壮大な風景や危険な試練に立ち向かいます。視聴者は彼らの勇気と決断力に感銘を受け、未知への魅力を再発見することでしょう。');
INSERT INTO tv_program_details VALUES (8, 8, 'バラエティ王は、笑いと楽しさが溢れるバラエティ番組です。さまざまなコーナーやゲーム、トークセッションなどを通じて、
ゲストや出演者たちの魅力や才能を引き出します。視聴者は笑いに包まれながら、バラエティの魅力と多様性を楽しむことでしょう。');
INSERT INTO tv_program_details VALUES (9, 9, 'サイエンスワールドは、科学と探求心がテーマの番組です。最新の科学技術や自然現象、宇宙の謎など、
興味深いサイエンスの世界を紹介します。視聴者は驚異的な事実や実験に触れることで、科学の不思議さと面白さを体感することができます。');
INSERT INTO tv_program_details VALUES (10, 10, 'ファッションクイーンは、最新のトレンドやスタイル、ファッションに関する情報を提供する番組です。
有名なデザイナーやスタイリスト、モデルたちが登場し、ファッションショー、メイクアップテクニック、スタイリングのアドバイスなどを紹介します');

COMMIT;

BEGIN TRANSACTION;

INSERT INTO episodes VALUES (1, 1, 1, '運命の出会い', '00:45:00','2022-05-01', 10354 );
INSERT INTO episodes VALUES (1, 1, 2, '二人の道', '00:50:00','2022-05-08', 8932);
INSERT INTO episodes VALUES (1, 1, 3, '遥かなる絆', '00:55:00','2022-05-15', 12567);
INSERT INTO episodes VALUES (1, 1, 4, '時を超える愛', '00:48:00','2022-05-22',11210 );

COMMIT;