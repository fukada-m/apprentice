require 'pg'

class Create_table

    def initialize
        @conn = PG.connect(
            host: 'postgres', # PostgreSQLサービスのコンテナ名を指定します。
            port: 5432, # PostgreSQLのデフォルトポート番号
            user: 'fukada',
            password: 'yami',
            dbname: 'internet_tv'
        )
    end

    def sql_test
        result = @conn.exec("SELECT b.start_time, b.end_time, c.channel, t.title,t.title_detail, g.genre
            FROM tv_program_list AS tv 
           INNER JOIN broadcast_times AS b ON tv.broadcast_time_id = b.broadcast_time_id
           INNER JOIN channels AS c ON tv.channel_id = c.channel_id
           INNER JOIN title_genre AS tg ON tv.title_id = tg.title_id
           INNER JOIN titles AS t ON t.title_id = tg.title_id
           INNER JOIN genres AS g ON g.genre_id = tg.genre_id
           WHERE c.channel_id = 2 
             AND b.start_time BETWEEN '2023-05-18 00:00:00' AND '2023-05-18 23:59:59';")

        result.each do |row|
            # puts "ID: #{row['id']}, Name: #{row['name']}"
            puts "#{row['genre']}"

        end
        # @conn.close
    end

    def issue_sql(sql)
        result = @conn.exec(sql)

        puts "|start_time|end_time|channel|title|title_detail|genre|"
        result.each do |row|
            puts "#{row['start_time']}, #{row['end_time']}, #{row['channel']},#{row['title']},#{row['title_detail']},#{row['genre']}"
        end
        @conn.close
    end


end

# 読み込んだファイルの1行目が合ってるかテストするコード
def file_read_test(txt)
    File.open(txt, 'r') do |f|
         f.gets
    end
end


def file_read(txt)
    File.open(txt, 'r') do |f|
        # while line = f.gets
        #     p line
        # end
        f.read
    end
end

# file_read('./ruby/sql/create_table.sql')
# file_read('./ruby/sql/insert_channel_and_genre.sql')
# file_read('./ruby/sql/insert_anime_data.sql')
create_table = Create_table.new
create_table.issue_sql(file_read('./ruby/sql/show_sample_data.sql'))
# create_table.sql_test

