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

    def show_all
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
                puts "「タイトル」#{row['title']}"
                puts "「説明」#{row['title_detail']}"
                print "「ジャンル」#{row['genre']}"
            end
        end
        puts ""
    end
end

show_all_ist = ShowAllList.new
show_all_ist.show_all