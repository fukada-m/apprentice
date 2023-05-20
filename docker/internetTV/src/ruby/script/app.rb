require 'pg'

class App

    def initialize
        @selected_num = 0
        @conn = PG.connect(
            host: 'postgres', # PostgreSQLサービスのコンテナ名を指定します。
            port: 5432, # PostgreSQLのデフォルトポート番号
            dbname: 'internet_tv',
            user: 'fukada',
            password: 'yami'
          )
          puts @conn.class
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
        puts "メニューを表示します。知りたいものの番号を入力してください"
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
        case num
        when 1
            run_menu1
        when 2
            run_menu2
        when 3
            run_menu3
        when 4
            run_menu4
        when 99
            true
        else
            puts "該当するメニューがありません"
        end
    end
    
    def run_menu1
        result = @conn.exec()
        
    end
    def run_menu2
        result = @conn.exec()
        
    end
    def run_menu3
        result = @conn.exec()
        
    end
    def run_menu4
        result = @conn.exec()
    end
end