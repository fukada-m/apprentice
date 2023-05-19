require 'pg'
require_relative './sql/create_table'

class SetupTvProgramList

    def initialize
        @conn = PG.connect(
            host: 'postgres', # PostgreSQLサービスのコンテナ名を指定します。
            port: 5432, # PostgreSQLのデフォルトポート番号
            user: 'fukada',
            password: 'yami',
            dbname: 'internet_tv'
        )
    end

    def create_program_list(date, channel_num)
        4.times do |n|
            title_num = rand(1..5)
            @conn.exec("INSERT INTO broadcast_times VALUES(#{n + 1}, '#{date} 0#{n*6}:00:00', '#{date} 0#{(n+1)*6}:00:00')")
            @conn.exec("INSERT INTO tv_program_list VALUES (#{n+1}, #{channel_num}, #{title_num} );")
        end
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
    end

    def end_connect
        @conn.close
    end


end

setupTvProgramList = SetupTvProgramList.new
setupTvProgramList.create_program_list('2023-05-19', 2)

