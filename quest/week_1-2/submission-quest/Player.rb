require_relative "human"

class Player < Human
    attr_accessor :is_next, :is_burst

    def initialize
        super
        @name = "あなた"
        @is_next = ""
        @is_burst = false
    end 
    
    # カードをもう1枚引くか質問する
    def want_next_card
        puts "カードを引きますか？（Y/N）"
        self.is_next = gets 
    end

    # バーストしたフラグを立てる
    def burst
        super
        self.is_burst = true
    end

end
