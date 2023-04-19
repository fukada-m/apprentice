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

    # デッキから先頭のカードを削除する
    def delete_card
        deck.delete_at(0)
    end

    # 得点を計算する
    def calc_score(human)
        human.score += deck[0][1]
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

    # ブラックジャックを修了する
    def exit
    end
end


class Human
    attr_accessor :hand, :score
    attr_reader :name 
    
    def initialize
        @hand = 0
        @score = 0
    end

    # カードを引く
    def draw(deck)
        self.hand = deck[0]
        puts "#{self.name}の引いたカードは#{self.hand[0]}です"
    end

    # 現在の得点を表示
    def show_score
        print "#{name}の現在の得点は#{score}です。"
    end

end

class Player < Human
    attr_accessor :isnext

    def initialize
        super
        @name = "あなた"
        @isnext = true
    end 

    # カードを引くか質問する
    def want_next_card
        print "カードを引きますか？（Y/N）"
        self.isnext = gets 
        puts isnext
    end

end

class Dealer < Human

    def initialize
        super
        @name ="ディーラー"
    end

end


#----------------ここからアウトプット-------------------
gameManager = GameManager.new
2.times do 
    gameManager.draw(gameManager.player)
    gameManager.calc_score(gameManager.player)
    gameManager.delete_card
end    
2.times do 
    gameManager.draw(gameManager.dealer)
    gameManager.calc_score(gameManager.dealer)
    gameManager.delete_card
end    
gameManager.show_score(gameManager.player)
gameManager.want_next_card(gameManager.player)

while gameManager.player.isnext == "Y\n" do
    gameManager.draw(gameManager.player)
    gameManager.calc_score(gameManager.player)
    gameManager.delete_card
    gameManager.show_score(gameManager.player)
    gameManager.want_next_card(gameManager.player)
end




