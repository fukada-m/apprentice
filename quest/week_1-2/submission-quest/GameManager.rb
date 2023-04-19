require_relative "player"
require_relative "dealer"

class GameManager 
    attr_accessor :deck
    attr_reader :dealer, :player

    def initialize
        @deck = []
        @player = Player.new
        @dealer = Dealer.new
        create_card
        shuffle
    end

    # カードを作成する
    private def create_card
        4.times do |index|
            mark = ["ハート", "ダイヤ", "スペード", "クローバー"]
            13.times do |num| 
                deck.push(["#{mark[index]}の#{num + 1}", num + 1]) 
            end
        end
    end
    
    # カードをシャッフルする
    private def shuffle
        self.deck = deck.sort_by{rand}
        puts "ブラックジャックを開始します"
    end

    # カードを1枚引く
    def draw(human)
        human.draw(deck)
    end

    # カードを見せる
    def show_card(human)
        human.show_card
    end

    # カードを見せない
    def not_show_card(human)
        human.not_show_card
    end

    # 2枚目のカードを見せる
    def open_card_No_2(human)
        human.open_card_No_2
    end

    # デッキから先頭のカードを削除する
    def delete_card
        deck.delete_at(0)
    end

    # 得点を計算する。カードの得点は最大10点
    def calc_score(human)
        if deck[0][1] > 10
            human.score += 10
        else
            human.score += deck[0][1]
        end
    end

    # 現在の得点を表示する
    def show_score(human)
        human.show_score
    end

    # カードを引くか質問する
    def want_next_card(player)
        player.want_next_card
    end

    # 勝敗を判定する
    def judge
        puts "あなたの得点は#{player.score}です。"
        puts "ディーラーの得点は#{dealer.score}です。"
        if dealer.score > 21 
            puts "ディーラーはバーストしました。"
            puts "あなたの勝ちです!"
        elsif player.score == dealer.score
            puts "引き分けです。" 
        elsif player.score > dealer.score
            puts "あなたの勝ちです!"
        else
            puts "あなたの負けです!"
        end
    end

    # バースト処理
    def burst(human)
        human.burst
    end

    # ブラックジャックを終了する
    def exit
        puts "ブラックジャックを終了します"
    end
end
