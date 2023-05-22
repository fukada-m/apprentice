require 'pg' 
require 'date'
require_relative 'module/connection_module'


# 実際に行う処理が記載されています。
class App
    include ConnectionModule


    def initialize
        @selected_num = 0
        @time = ""
        @conn = conn
    end
    def start
        loop do
            disp_menu
            input_num
            break if decide_menu(@selected_num)
        end
        @conn.close
    end

    private
    def disp_menu
        puts "\nメニューを表示します。知りたいものの番号を入力してください"
        puts "1. エピソード視聴数トップ3のエピソード名と視聴数を表示してください。" 
        puts "2. エピソード視聴数トップ3のタイトル、シーズン数、エピソード数、エピソード名、視聴数を表示してください"
        puts "3. 本日放送される全ての番組に対して、チャンネル名、放送時刻、タイトル、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を表示してください"
        puts "4. 本日から一週間分のドラマチャンネルの放送時刻、シーズン数、タイトル、エピソード数、エピソード名、エピソード詳細を表示してください"
        puts "99. 終了"
    end

    def input_num
        @selected_num = gets.chomp.to_i
    end

    def decide_menu(num)
        puts "#{num}番が選択されました。"
        case num
        when 1
            run_menu1
        when 2
            run_menu2
        when 3
            run_menu3
        when 4
            run_menu4
        when 5
            run_menu5
        when 6
            run_menu6
        when 99
            puts "終了します"
            true
        else
            puts "該当するメニューがありません"
        end
    end
    
    def run_menu1
        n = 1
        result = @conn.exec("SELECT episode, views
                               FROM episodes
                              ORDER BY views DESC
                              LIMIT 3;")
        
        puts "エピソード視聴数トップ3を表示します。"

        result.each do |row|
            puts "#{n}位のエピソードは#{row['episode']}で、視聴数は#{row['views']}回です。"
            n += 1
        end
        false
    end

    def run_menu2
        n = 1
        result = @conn.exec("SELECT t.title, e.season_num, e.episode_num, e.episode, e.views
                               FROM title_episode AS te
                              INNER JOIN titles AS t ON te.title_id = t.title_id
                              INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                              ORDER BY e.views DESC
                              LIMIT 3;")

        puts "エピソード視聴数トップ3の詳細を表示します。"

        result.each do |row|
            puts "#{n}位のエピソードは#{row['title']}のシーズン#{row['season_num']}の#{row['episode_num']}話でエピソード名は#{row['episode']}で視聴数は#{row['views']}です。"
            n += 1
        end
        false
    end

    def run_menu3
        @time = ""
        result = @conn.exec("SELECT b.start_time, b.end_time, c.channel, t.title, e.season_num, e.episode_num, e.episode, e.episode_detail
                               FROM tv_program_list AS tv 
                              INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
                              INNER JOIN channels AS c ON tv.channel_id = c.channel_id
                              INNER JOIN titles AS t ON tv.title_id = t.title_id
                              INNER JOIN title_episode AS te ON t.title_id = te.title_id
                              INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                              WHERE DATE(b.start_time ) = CURRENT_DATE
                              ORDER BY c.channel_id, b.start_time, e.episode_num;")

        puts "本日の番組表を表示します。"

        result .each do |row|
            show_tv_program_list(row)
        end
        false
    end

    def run_menu4
        @time =""
        result = @conn.exec("SELECT b.start_time, b.end_time, t.title, e.season_num, e.episode_num, e.episode, e.episode_detail
                               FROM tv_program_list AS tv 
                              INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
                              INNER JOIN titles AS t ON tv.title_id = t.title_id
                              INNER JOIN title_episode AS te ON t.title_id = te.title_id
                              INNER JOIN episodes AS e ON te.episode_id = e.episode_id
                              WHERE tv.channel_id = 1 AND DATE(b.start_time) BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days'
                              ORDER BY b.start_time, e.episode_num;")
        puts "今日から１週間分のドラマチャンネルの番組表を表示します。"
        result.each do |row|
            show_tv_program_list(row)
        end
        false
    end

    def run_menu5
        result = @conn.exec(
            "SELECT DISTINCT e.episode, e.views
               FROM title_episode AS te 
              INNER JOIN titles AS t ON te.title_id = t.title_id
              INNER JOIN episodes AS e ON te.episode_id = e.episode_id
              INNER JOIN tv_program_list AS tv ON te.title_id = tv.title_id
              INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
              WHERE DATE(b.start_time) BETWEEN CURRENT_DATE - INTERVAL '7 days' AND CURRENT_DATE
              ORDER BY e.views DESC
              LIMIT 2;")

        puts "直近1週間に放送され、最も見られたエピソードトップ2を表示します。"
        result.each do |row|
            puts "「タイトル」#{row['episode']}「視聴数」#{row['views']}"
        end
        false
    end

    def run_menu6
        result = @conn.exec(
            "WITH avg AS (
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
        )
        puts "ジャンルごとの視聴数がトップの番組と最大視聴数（複数のエピソードがある場合はその平均値）を表示します。"
        result.each do |row|
            puts "「ジャンル」#{row['genre']}「タイトル」#{row['title']}「最大視聴数」#{row['max_views'].to_i}回"
        end
        false

    end

    def show_tv_program_list(row)
        if @time == row['start_time']
            puts "#{row['episode_num']}話「エピソード名」#{row['episode']}「エピソード詳細」#{row['episode_detail']}"
        else 
            @time = row['start_time']
            puts "「チャンネル」 #{row['channel']}"
            puts "「放送時間」#{row['start_time']} ~ #{row['end_time']}"
            puts "「タイトル」#{row['title']} シーズン#{row['season_num']}"
            puts "#{row['episode_num']}話「エピソード名」 #{row['episode']}「エピソード詳細」#{row['episode_detail']}"
        end
    end
end