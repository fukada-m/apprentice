
class GameManager 
    def initialize
        # カードを生成する
        @deck = []
        create_card(@deck)
        @player_hand = 0
    end

    # カードを作成する
    def create_card(deck)
        4.times do |index|
            mark = ["ハート", "ダイヤ", "スペード", "クローバー"]
            13.times do |num| 
                deck.push("#{mark[index]}の#{num+1}") 
            end
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

class Actor
end


gameManager = GameManager.new
gameManager.start
gameManager.draw
gameManager.delete_card
gameManager.draw
gameManager.delete_card
