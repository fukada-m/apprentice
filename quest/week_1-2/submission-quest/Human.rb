class Human
    attr_accessor :hand, :score
    attr_reader :name
    
    def initialize(name)
        @name = name
        @hand = ""
        @score = 0
    end

    public
    
    def draw(deck)
        draw_a_card(deck)
        calc_score
        show_card
    end
    
    def show_score
        puts "#{name}の現在の得点は#{score}点です。"
    end

    def check_score?
        true if score > 21
    end
    
    def burst
        puts "#{name}はバーストしました、負けです。"
    end


    def check_A(deck)
        rule_A.check_A(deck)
    end
    
    def score_up_check(deck)
        rule_A.score_up_check(deck)
    end

    private

    def draw_a_card(deck)
        self.hand = deck[0]
    end

    def calc_score
        if hand[1] > 10
            self.score += 10
        else
            self.score += hand[1]
        end
    end

    def show_card
        puts "#{name}の引いたカードは#{hand[0]}です。"
    end

    

    def score_down
        rule_A.score_down
    end

end
