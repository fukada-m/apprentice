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