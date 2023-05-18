-- 全ての番組の情報を表示する
SELECT tv1.air_time, c.channel_name, t.title_name, tv2.program_detail, g.genre_name
  FROM tv_program AS tv1 
 INNER JOIN channels AS c ON tv1.channel_id = c.channel_id
 INNER JOIN titles AS t ON tv1.title_id = t.title_id
 INNER join tv_program_details AS tv2 ON tv1.title_id = tv2.title_id
 INNER JOIN genres AS g ON tv2.genre_id = g.genre_id;

--各エピソードの情報を表示する
SELECT e1.season_num, e1.episode_num, t.title_name, e2.episode_detail, e2.video_time, e2.publication_date, e2.views
FROM episodes AS e1 
INNER JOIN titles AS t ON e1.title_id = t.title_id
INNER JOIN episode_details AS e2 ON e1.episode_detail_id = e2.episode_detail_id