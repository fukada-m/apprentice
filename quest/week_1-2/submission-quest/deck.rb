class Deck
    attr_accessor :deck

    def initialize
        @deck = []
    end 

    public

    def create_deck
        create_cards
        shuffle
    end

    def delete_card
        deck.delete_at(0)
    end

    private

    def create_cards
        4.times do |index|
            mark = ["ハート", "ダイヤ", "スペード", "クローバー"]
            13.times do |num| 
                # 例　["ハートの2", 2]
                self.deck.push(["#{mark[index]}の#{num + 1}", num + 1]) 
            end
        end
    end

    def shuffle
        self.deck = deck.shuffle
    end

end
