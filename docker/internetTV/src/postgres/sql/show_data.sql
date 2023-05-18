-- 全ての番組の情報を表示する
SELECT tv1.air_time, c.channel_name, t.title_name, tv2.program_detail, g.genre_name
  FROM tv_program AS tv1 
 INNER JOIN channels AS c ON tv1.channel_id = c.channel_id
 INNER JOIN titles AS t ON tv1.title_id = t.title_id
 INNER JOIN tv_program_details AS tv2 ON tv1.title_id = tv2.title_id
 INNER JOIN genres AS g ON tv2.genre_id = g.genre_id;

--各エピソードの情報を表示する
SELECT e.season_num, e.episode_num, t.title_name, e.episode_detail, e.video_time, e.publication_date, e.views
FROM episodes AS e 
INNER JOIN titles AS t ON e.title_id = t.title_id