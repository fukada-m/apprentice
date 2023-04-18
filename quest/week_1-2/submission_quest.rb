
class GameManager 
    attr_accessor :deck
    attr_reader :dealer, :player

    def initialize
        # カードを生成する
        @deck = []
        @player = Player.new
        @dealer = Dealer.new
        create_card(@deck)
        
    end

    # カードを作成する
    def create_card(deck)
        4.times do |index|
            mark = ["ハート", "ダイヤ", "スペード", "クローバー"]
            13.times do |num| 
                deck.push("#{mark[index]}の#{num+1}") 
            end
        end
    end
        # カードをシャッフルする
    def start
        @deck = @deck.sort_by{rand}
        puts "ブラックジャックを開始します"
    end

        # カードを引く
    def draw(human)
        human.draw(@deck)
    end

    # デッキからカードを削除する
    def delete_card
        @deck.delete_at(0)
    end

    # 現在の得点を表示する
    def show_points

    end

    # カードを引くか聞く？
    def dwaw_next_card?
    end

    # 勝敗を判定する
    def judge
    end

    # ブラックジャックを修了する
    def exit
    end
end


class Human
    attr_accessor :hand
    attr_reader :name

    def initialize
        @hand = 0
    end
    
    def draw(deck)
        self.hand = deck[0]
        puts "#{self.name}の引いたカードは#{self.hand}です"
    end
end


class Player < Human

    def initialize
        super
        @name ="あなた"
    end 
end

class Dealer < Human

    def initialize
        super
        @name ="ディーラー"
    end

end



gameManager = GameManager.new
gameManager.start
2.times do 
    gameManager.draw(gameManager.player)
    gameManager.delete_card
end    
2.times do 
    gameManager.draw(gameManager.dealer)
    gameManager.delete_card
end    
