require_relative "human"

class Player < Human
    attr_accessor :isnext, :isburst

    def initialize
        super
        @name = "あなた"
        @isnext = ""
        @isburst = false
    end 
    
    # カードをもう1枚引くか質問する
    def want_next_card
        puts "カードを引きますか？（Y/N）"
        self.isnext = gets 
    end

    # バーストしたフラグを立てる
    def burst
        super
        self.isburst = true
    end

end
