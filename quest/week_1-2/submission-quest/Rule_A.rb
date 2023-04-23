class Rule_A
    attr_accessor :count
    
    public

    def check_A?(deck)
        true if deck[0][1] == 1
    end
    
    def score_down
        if count >= 1
            self.count -= 1
            puts "Aの得点を1枚1点にしました。"
            true
        else
            false
        end
    end

    private


end