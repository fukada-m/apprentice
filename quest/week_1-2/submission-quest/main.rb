require_relative "GameManager"

# プレイヤーがカードを引いて公開する
def player_draw_and_show_cards(gameManager)
    gameManager.draw(gameManager.player)
    gameManager.check_A(gameManager.player)
    gameManager.score_up_check(gameManager.player)
    gameManager.calc_score(gameManager.player)
    gameManager.delete_card
    gameManager.show_card(gameManager.player)
end

# ディーラーがカードを引いて公開する
def dealer_draw_and_show_cards(gameManager, num = 0)
    gameManager.draw(gameManager.dealer)
    gameManager.check_A(gameManager.dealer)
    gameManager.score_up_check(gameManager.dealer)
    gameManager.calc_score(gameManager.dealer)
    gameManager.delete_card
    if num < 1
        gameManager.show_card(gameManager.dealer)
    else
        gameManager.not_show_card(gameManager.dealer)
    end
end

# ゲームマネージャーのインスタンスを作成
gameManager = GameManager.new

# プレイヤーが2枚引く
2.times do 
    player_draw_and_show_cards(gameManager)
end   

# ディーラーが2枚引く
2.times do |num|
    dealer_draw_and_show_cards(gameManager, num)
end    

# 得点を見せてもう１枚引くか聞く
gameManager.show_score(gameManager.player)
gameManager.want_next_card(gameManager.player)

# カードを引くのをやめるかバーストするまで引き続ける
while gameManager.player.is_next == "Y\n" do
    player_draw_and_show_cards(gameManager)
    gameManager.show_score(gameManager.player)
    if gameManager.player.score <= 21 || gameManager.score_down(gameManager.player)
        gameManager.want_next_card(gameManager.player)
    elsif 
        gameManager.burst(gameManager.player)
        break
    end
end

# プレイヤーがバーストしてたらこの処理は行わない
if gameManager.player.is_burst

    else
    gameManager.open_card_No_2(gameManager.dealer)
    gameManager.show_score(gameManager.dealer)
    # ディーラーは17以上になるまで引き続ける
    while gameManager.dealer.score < 17
        dealer_draw_and_show_cards(gameManager)
        gameManager.score_down(gameManager.dealer) if gameManager.dealer.score > 21
            
    end
    gameManager.judge
end
gameManager.exit

