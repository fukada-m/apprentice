# ブラックジャックをするクラス
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
    end

    # バースト処理
    def burst(human)
        human.burst
    end

    # ブラックジャックを修了する
    def exit
        puts "ブラックジャックを終了します"
    end
end


class Human
    attr_accessor :hand, :score
    attr_reader :name 
    
    def initialize
        @hand = 0
        @score = 0
    end

    # カードを1枚引く
    def draw(deck)
        self.hand = deck[0]
    end

    # カードを見せる
    def show_card
        puts "#{name}の引いたカードは#{hand[0]}です。"
    end

    # 現在の得点を表示
    def show_score
        puts "#{name}の現在の得点は#{score}です。"
    end

    # バースト処理
    def burst
        puts "#{name}はバーストしました、負けです。"
    end

end

class Player < Human
    attr_accessor :isnext

    def initialize
        super
        @name = "あなた"
        @isnext = ""
    end 
    
    # カードをもう1枚引くか質問する
    def want_next_card
        puts "カードを引きますか？（Y/N）"
        self.isnext = gets 
    end

end

class Dealer < Human

    def initialize
        super
        @name ="ディーラー"
    end

    # カードを見せない
    def not_show_card
        puts "ディーラーの引いた2枚目のカードはわかりません。"
    end

    # 2枚目のカードを見せる
    def open_card_No_2
        puts "ディーラーの引いた2枚目のカードは#{hand[0]}でした。"
    end
end


#----------------ここからアウトプット-------------------
# todo　バーストするか勝敗がつくまで無限ループするようにする
gameManager = GameManager.new
# プレイヤーが2枚引く
2.times do 
    gameManager.draw(gameManager.player)
    gameManager.calc_score(gameManager.player)
    gameManager.delete_card
    gameManager.show_card(gameManager.player)
end   
# ディーラーが2枚引く
2.times do |num|
    gameManager.draw(gameManager.dealer)
    gameManager.calc_score(gameManager.dealer)
    gameManager.delete_card
    if num < 1
        gameManager.show_card(gameManager.dealer)
    else
        gameManager.not_show_card(gameManager.dealer)
    end
end    
# 得点を見せてもう１枚引くか聞く
gameManager.show_score(gameManager.player)
gameManager.want_next_card(gameManager.player)
# カードを引くのを辞めるかバーストするまで引き続ける
while gameManager.player.isnext == "Y\n" do
    gameManager.draw(gameManager.player)
    gameManager.calc_score(gameManager.player)
    gameManager.delete_card
    gameManager.show_card(gameManager.player)
    gameManager.show_score(gameManager.player)
    if gameManager.player.score <= 21
        gameManager.want_next_card(gameManager.player)
    else
        gameManager.player.isnext = "N"
        puts gameManager.burst(gameManager.player)
    end
end
# ディーラーの２枚目を表示
gameManager.open_card_No_2(gameManager.dealer)
# ディーラーの得点を表示
gameManager.show_score(gameManager.dealer)
# ディーラーは17点以上になるまで引き続ける
while gameManager.dealer.score < 17
    gameManager.draw(gameManager.dealer)
    gameManager.calc_score(gameManager.dealer)
    gameManager.delete_card
    gameManager.show_card(gameManager.dealer)
end
# プレイヤーの得点を表示
# ディーラーの得点を表示
# 勝敗判定
gameManager.exit


