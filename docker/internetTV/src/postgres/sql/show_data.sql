-- 5/18丸一日のアニメチャンネルの番組の情報を表示する
SELECT b.start_time, b.end_time, c.channel, t.title, g.genre
  FROM tv_program_list AS tv 
 INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
 INNER JOIN channels AS c ON tv.channel_id = c.channel_id
 INNER JOIN title_genre AS tg ON tv.title_id = tg.title_id
 INNER JOIN titles AS t ON t.title_id = tg.title_id
 INNER JOIN genres AS g ON g.genre_id = tg.genre_id
 WHERE c.channel_id = 2;

--各エピソードの情報を表示する
-- SELECT e.season_num, e.episode_num, t.title_name, e.episode_detail, e.video_time, e.publication_date, e.views
-- FROM episodes AS e 
-- INNER JOIN titles AS t ON e.title_id = t.title_id