class Rule_A
    attr_accessor :count

    def initialize
        @count = 0
    end
    
    def check_A(deck)
        self.count += 1 if deck[0][1] == 1
    end

    def score_up_check(deck)
        true if count >= 1 && deck[0][1] == 1
    end
    

end