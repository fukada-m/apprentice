require 'pg'

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

    def create_anime_program_list(date)
        result = @conn.exec("SELECT MAX(broadcast_time_id) FROM broadcast_times")
        id = result[0]['max'].to_i
        4.times do |n|
            title_num = rand(1..5)
            @conn.exec("INSERT INTO broadcast_times VALUES( #{id+n+1}, '#{date} 0#{n*6}:00:00', '#{date} 0#{(n+1)*6}:00:00')")
            @conn.exec("INSERT INTO tv_program_list VALUES ( #{id+n+1} , 2, #{title_num} );")
        end
    end

    def create_drama_program_list(date)
        result = @conn.exec("SELECT MAX(broadcast_time_id) FROM broadcast_times")
        id = result[0]['max'].to_i
        2.times do |n|
            title_num = rand(6..9)
            @conn.exec("INSERT INTO broadcast_times VALUES( #{id+n+1}, '#{date} 0#{n*12}:00:00', '#{date} 0#{(n+1)*12}:00:00')")
            @conn.exec("INSERT INTO tv_program_list VALUES ( #{id+n+1} , 1, #{title_num} );")
        end
    end

    def end_connect
        @conn.close
    end
end

setup_tv_programList = SetupTvProgramList.new
(19..30).each { |i| setup_tv_programList.create_anime_program_list("2023-05-#{i}") }
(19..30).each { |i| setup_tv_programList.create_drama_program_list("2023-05-#{i}") }
setup_tv_programList.end_connect


