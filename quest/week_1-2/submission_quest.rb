
class GameManager 
    def initialize
        # カードを生成する
        create_card
        @deck = [
            1,2,3,4,5,6,7,8,9,10,11,12,13,
            1,2,3,4,5,6,7,8,9,10,11,12,13,
            1,2,3,4,5,6,7,8,9,10,11,12,13,
            1,2,3,4,5,6,7,8,9,10,11,12,13,
        ]
        @player_hand = 0
    end

    # カードを作成する
    def create_card
        13.times do |num| 
            @deck
        end
    end
        # カードをシャッフルする
    def start
        @deck = @deck.sort_by{rand}
        puts "ブラックジャックを開始します"
    end

        # カードを引く
    def draw
        @player_hand = @deck[0]
        puts "あなたの引いたカードは#{@player_hand}です"
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


gameManager = GameManager.new
gameManager.start
gameManager.draw
gameManager.delete_card
gameManager.draw