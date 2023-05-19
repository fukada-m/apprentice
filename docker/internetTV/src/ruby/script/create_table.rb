require 'pg'
require_relative './sql/create_table'

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



create_table = Create_table.new
# create_table.issue_sql(file_read('./ruby/sql/show_data_anime_05_18.sql'))
create_table.sql_test

