# frozen_string_literal: true

require 'pg'
require 'date'
require 'debug'
['module/connection_module', 'module/run_menu', 'menu'].each { |file| require_relative file }

# 実際に行う処理が記載されています。
class App
  include ConnectionModule
  include RunMenu

  def initialize
    @selected_num = 0
    @time = ''
    @conn = conn
    @menu = Menu.new
    @menu1_sql = "SELECT episode, views
                    FROM episodes
                   ORDER BY views DESC
                   LIMIT 3;"
    @menu2_sql = "SELECT t.title, e.season_num, e.episode_num, e.episode, e.views
                    FROM title_episode AS te
                   INNER JOIN titles AS t ON te.title_id = t.title_id
                   INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                   ORDER BY e.views DESC
                   LIMIT 3;"
    @menu3_sql = "SELECT b.start_time, b.end_time, c.channel, t.title, e.season_num,
                         e.episode_num, e.episode, e.episode_detail
                    FROM tv_program_list AS tv
                   INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
                   INNER JOIN channels AS c ON tv.channel_id = c.channel_id
                   INNER JOIN titles AS t ON tv.title_id = t.title_id
                   INNER JOIN title_episode AS te ON t.title_id = te.title_id
                   INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                   WHERE DATE(b.start_time ) = CURRENT_DATE
                   ORDER BY c.channel_id, b.start_time, e.episode_num;"
    @menu4_sql = "SELECT b.start_time, b.end_time, t.title, e.season_num, e.episode_num, e.episode, e.episode_detail
                    FROM tv_program_list AS tv
                   INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
                   INNER JOIN titles AS t ON tv.title_id = t.title_id
                   INNER JOIN title_episode AS te ON t.title_id = te.title_id
                   INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                   WHERE tv.channel_id = 1
                     AND DATE(b.start_time) BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days'
                   ORDER BY b.start_time, e.episode_num;"
    @menu5_sql = "SELECT DISTINCT e.episode, e.views
                    FROM title_episode AS te
                   INNER JOIN titles AS t ON te.title_id = t.title_id
                   INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                   INNER JOIN tv_program_list AS tv ON te.title_id = tv.title_id
                   INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
                   WHERE DATE(b.start_time) BETWEEN CURRENT_DATE - INTERVAL '7 days' AND CURRENT_DATE
                   ORDER BY e.views DESC
                   LIMIT 2;"
    @menu6_sql = "WITH avg AS (
                  SELECT tg.genre_id, tg.title_id, AVG(e.views) as avg_views
                    FROM title_genre AS tg
                   INNER JOIN title_episode AS te ON tg.title_id = te.title_id
                   INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                   GROUP BY tg.genre_id, tg.title_id
                  ),max AS (
                  SELECT genre_id, MAX(avg_views) as max_views
                    FROM avg
                   GROUP BY genre_id
                  )
                  SELECT g.genre, t.title, m.max_views
                    FROM max AS m
                   INNER JOIN avg AS a ON m.genre_id = a.genre_id AND m.max_views = a.avg_views
                   INNER JOIN genres AS g ON m.genre_id = g.genre_id
                   INNER JOIN titles AS t ON a.title_id = t.title_id
                   ORDER BY g.genre_id;"
  end

  def start
    loop do
      disp_menu(@menu.menus)
      break if input_num

      decide_menu(@selected_num)
    end
    @conn.close
  end

  private

  def disp_menu(menus)
    menus.each { |menu| puts menu }
  end

  def input_num
    @selected_num = gets.chomp.to_i
    case @selected_num
    when 1, 2, 3, 4, 5, 6 then puts "#{@selected_num}番が選択されました。"
    when 99
      puts '終了します'
      true
    else
      puts '該当するメニューがありません'
    end
  end

  def decide_menu(num)
    case num
    when 1 then run_menu1
    when 2 then run_menu2
    when 3 then run_menu3
    when 4 then run_menu4
    when 5 then run_menu5
    when 6 then run_menu6
    end
  end
end
