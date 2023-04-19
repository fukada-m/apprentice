require_relative "human"

class Dealer < Human

    def initialize
        super
        @name ="ディーラー"
    end

    # カードを見せない
    def not_show_card
        puts "ディーラーの引いた2枚目のカードはわかりません。"
    end

    # 2枚目のカードを見せる
    def open_card_No_2
        puts "ディーラーの引いた2枚目のカードは#{hand[0]}でした。"
    end

end