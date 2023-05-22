# frozen_string_literal: true

require 'pg'
require_relative 'module/connection_module'
require 'debug'

# 全ての情報を取得します。
class ShowAllList
  include ConnectionModule

  def initialize
    @conn = conn
  end

  def query_all_program
    result = @conn.exec("SELECT b.start_time, b.end_time, c.channel, t.title,t.title_detail, g.genre
            FROM tv_program_list AS tv
           INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
           INNER JOIN channels AS c ON tv.channel_id = c.channel_id
           INNER JOIN titles AS t ON tv.title_id = t.title_id
           INNER JOIN title_genre AS tg ON tv.title_id = tg.title_id
           INNER JOIN genres AS g ON tg.genre_id = g.genre_id;")

    puts '全ての番組リストを表示します'
    result
  end

  def query_all_episode
    result = @conn.exec("SELECT t.title, e.season_num, e.episode_num, e.episode,
      e.episode_detail, e.video_time, e.publication_date, e.views
      FROM title_episode AS te
      INNER JOIN titles AS t ON te.title_id = t.title_id
      INNER JOIN episodes AS e ON te.episode_id = e.episode_id;")
    puts '全てのタイトルとそのエピソードを表示します。'
    result
  end

  def show_all_program(result)
    time = ''
    result.each do |row|
      print ", #{row['genre']}" if time == row['start_time']
      next if time == row['start_time']

      time = row['start_time']
      puts "\n\n #{row['start_time']}~#{row['end_time']}"
      puts "「チャンネル」#{row['channel']} \n 「タイトル」#{row['title']}"
      puts "「説明」#{row['title_detail']} \n「ジャンル」#{row['genre']}"
    end
  end

  def show_all_episode(result)
    title = ''
    result.each do |row|
      unless title == row['title']
        title = row['title']
        puts "「タイトル」：#{row['title']} \n 「シーズンNo.」：#{row['season_num']}"
      end
      episode_detail({ num: row['episode_num'], episode: row['episode'],
                       episode_detail: row['episode_detail'], video_time: row['video_time'],
                       publication_date: row['publication_date'], views: row['views'] })
    end
  end

  def episode_detail(params)
    num = params[:num]
    episode = params[:episode]
    detail = params[:episode_detail]
    time = params[:video_time]
    date = params[:publication_date]
    views = params[:views]
    puts "「エピソードNo.」：#{num} \n 「エピソード名」：#{episode}"
    puts "「エピソードの詳細」：#{detail} \n 「動画時間」：#{time}"
    puts "「公開日」：#{date} \n 「視聴数」：#{views}\n\n"
  end
end

show_all_list = ShowAllList.new

show_all_list.show_all_program(show_all_list.query_all_program)
show_all_list.show_all_episode(show_all_list.query_all_episode)
