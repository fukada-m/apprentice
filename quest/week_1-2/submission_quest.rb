# ブラックジャックをするクラス
class GameManager 
    attr_accessor :deck
    attr_reader :dealer, :player

    def initialize
        # カードを生成する
        @deck = []
        @player = Player.new
        @dealer = Dealer.new
        create_card(deck)
        
    end

    # カードを作成する
    private def create_card(deck)
        4.times do |index|
            mark = ["ハート", "ダイヤ", "スペード", "クローバー"]
            13.times do |num| 
                deck.push("#{mark[index]}の#{num+1}") 
            end
        end
    end
    
        # カードをシャッフルする
     def shuffle
        self.deck = deck.sort_by{rand}
        puts "ブラックジャックを開始します"
    end

        # カードを引く
    def draw(human)
        human.draw(deck)
    end

    # デッキからカードを削除する
    def delete_card
        deck.delete_at(0)
    end

    # 現在の得点を表示する
    def show_points(human)
        human.show_points
    end

    # カードを引くか聞く
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
    attr_accessor :hand, :points
    attr_reader :name 

    def initialize
        @hand = 0
        @points = 0
    end
    
    def draw(deck)
        self.hand = deck[0]
        puts "#{self.name}の引いたカードは#{self.hand}です"
    end

    # 現在の得点を表示
    def show_points
        print "#{name}の現在の得点は0です。"
    end

    
end


class Player < Human
    attr_accessor :isnext

    def initialize
        super
        @name ="あなた"
        @isnext = true
    end 

    # カードを引くか聞く
    def want_next_card
        print "カードを引きますか？（Y/N）"
        self.isnext = gets 
    end
end

class Dealer < Human

    def initialize
        super
        @name ="ディーラー"
    end

end



gameManager = GameManager.new
gameManager.shuffle
2.times do 
    gameManager.draw(gameManager.player)
    gameManager.delete_card
end    
2.times do 
    gameManager.draw(gameManager.dealer)
    gameManager.delete_card
end    
gameManager.show_points(gameManager.player)
gameManager.want_next_card(gameManager.player)
if gameManager.player.isnext == "Y\n"
    gameManager.draw(gameManager.player)
    gameManager.delete_card
end

