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
        result = @conn.exec("select * from genres; select * from titles;")

        result.each do |row|
            # puts "ID: #{row['id']}, Name: #{row['name']}"
            puts "#{row['genre']} #{row['title']}"

        end
        # @conn.close
    end

    def issue_sql(sql)
        time = ""
        result = @conn.exec(sql)

        puts "5/18のアニメチャンネルの番組内容は"
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
# create_table.issue_sql(file_read('./ruby/sql/show_data_anime_05_18.sql'))
create_table.sql_test

