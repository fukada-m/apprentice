require 'pg'

class ShowAllList

    def initialize
        @conn = PG.connect(
            host: 'postgres', # PostgreSQLサービスのコンテナ名を指定します。
            port: 5432, # PostgreSQLのデフォルトポート番号
            user: 'fukada',
            password: 'yami',
            dbname: 'internet_tv'
        )
    end

    def show_all_program
        time = ""
        result = @conn.exec("SELECT b.start_time, b.end_time, c.channel, t.title,t.title_detail, g.genre
            FROM tv_program_list AS tv 
           INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
           INNER JOIN channels AS c ON tv.channel_id = c.channel_id
           INNER JOIN titles AS t ON tv.title_id = t.title_id
           INNER JOIN title_genre AS tg ON tv.title_id = tg.title_id
           INNER JOIN genres AS g ON tg.genre_id = g.genre_id;")

        puts "全ての番組リストを表示します"

        result.each do |row|
            if time == row['start_time']
                print ", #{row['genre']}"
            else
                puts "\n\n"
                time = row['start_time']
                puts "#{row['start_time']}~#{row['end_time']}"
                puts "「チャンネル」#{row['channel']}"
                puts "「タイトル」#{row['title']}"
                puts "「説明」#{row['title_detail']}"
                print "「ジャンル」#{row['genre']}"
            end
        end
        puts ""
    end

    def show_all_episode
        title = ''
        puts "全てのタイトルとそのエピソードを表示します。"
        result = @conn.exec("SELECT t.title, e.season_num, e.episode_num, e.episode, e.episode_detail, e.video_time, e.publication_date, e.views
                              FROM title_episode AS te
                             INNER JOIN titles AS t ON te.title_id = t.title_id 
                             INNER JOIN episodes AS e ON te.episode_id = e.episode_id;")
        result.each do |row|
            if title == row['title'] 
                episode_detail(row['episode_num'], row['episode'], row['episode_detail'], row['video_time'], row['publication_date'], row['views'])
                
            else
                title = row['title']
                puts "「タイトル」：#{row['title']}"
                puts "「シーズンNo.」：#{row['season_num']}"
                episode_detail(row['episode_num'], row['episode'], row['episode_detail'], row['video_time'], row['publication_date'], row['views'])
            end
        end
        
    end

    def episode_detail(num, episode, detail, time, date, view)
        puts "「エピソードNo.」：#{num}"
        puts "「エピソード名」：#{episode}"
        puts "「エピソードの詳細」：#{detail}"
        puts "「動画時間」：#{time}"
        puts "「公開日」：#{date}"
        puts "「視聴数」：#{view}"
        puts ""
    end

end

show_all_list = ShowAllList.new
show_all_list.show_all_program
show_all_list.show_all_episode