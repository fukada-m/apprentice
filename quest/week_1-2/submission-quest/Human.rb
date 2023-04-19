require_relative "rule_a"

class Human
    attr_accessor :hand, :score
    attr_reader :name, :rule_A 
    
    def initialize
        @hand = 0
        @score = 0
        @rule_A = Rule_A.new
    end

    # カードを1枚引く
    def draw(deck)
        self.hand = deck[0]
    end

    def check_A(deck)
        rule_A.check_A(deck)
    end

    def score_up_check(deck)
        rule_A.score_up_check(deck)
    end

    # カードを見せる
    def show_card
        puts "#{name}の引いたカードは#{hand[0]}です。"
    end

    # 現在の得点を表示
    def show_score
        puts "#{name}の現在の得点は#{score}です。"
    end

    def score_down
        rule_A.score_down
    end
    # バースト処理
    def burst
        puts "#{name}はバーストしました、負けです。"
    end

end
