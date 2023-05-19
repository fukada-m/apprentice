-- 5/19のアニメチャンネルの番組一覧を表示する
SELECT b.start_time, b.end_time, c.channel, t.title,t.title_detail, g.genre
  FROM tv_program_list AS tv 
 INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
 INNER JOIN channels AS c ON tv.channel_id = c.channel_id
 INNER JOIN title_genre AS tg ON tv.title_id = tg.title_id
 INNER JOIN titles AS t ON t.title_id = tv.title_id
 INNER JOIN genres AS g ON g.genre_id = tg.genre_id
 WHERE c.channel_id = 2 
   AND b.start_time BETWEEN '2023-05-19 00:00:00' AND '2023-05-19 23:59:59';


-- 5/18のアニメチャンネルで放送される番組の全てのエピソードを表示する
SELECT c.channel, t.title, e.season_num, e.episode_num, e.episode, e.episode_detail, e.video_time, e.publication_date ,e.views
  FROM tv_program_list AS tv 
 INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
 INNER JOIN channels AS c ON tv.channel_id = c.channel_id
 INNER JOIN title_episode AS te ON tv.title_id = te.title_id
 INNER JOIN titles AS t ON te.title_id = t.title_id
 INNER JOIN episodes AS e ON te.episode_id = e.episode_id
 WHERE c.channel_id = 2
   AND b.start_time BETWEEN '2023-05-18 00:00:00' AND '2023-05-18 23:59:59';
