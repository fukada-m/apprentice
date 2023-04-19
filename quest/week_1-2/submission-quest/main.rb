require_relative "gameManager"

gameManager = GameManager.new
# プレイヤーが2枚引く
2.times do 
    gameManager.draw(gameManager.player)
    gameManager.calc_score(gameManager.player)
    gameManager.delete_card
    gameManager.show_card(gameManager.player)
end   
# ディーラーが2枚引く
2.times do |num|
    gameManager.draw(gameManager.dealer)
    gameManager.calc_score(gameManager.dealer)
    gameManager.delete_card
    if num < 1
        gameManager.show_card(gameManager.dealer)
    else
        gameManager.not_show_card(gameManager.dealer)
    end
end    
# 得点を見せてもう１枚引くか聞く
gameManager.show_score(gameManager.player)
gameManager.want_next_card(gameManager.player)
# カードを引くのを辞めるかバーストするまで引き続ける
while gameManager.player.isnext == "Y\n" do
    gameManager.draw(gameManager.player)
    gameManager.calc_score(gameManager.player)
    gameManager.delete_card
    gameManager.show_card(gameManager.player)
    gameManager.show_score(gameManager.player)
    if gameManager.player.score <= 21
        gameManager.want_next_card(gameManager.player)
    else
        gameManager.burst(gameManager.player)
        break
    end
end
# バーストしてたら修了する
if gameManager.player.isburst
    else
    # ディーラーの２枚目を表示
    gameManager.open_card_No_2(gameManager.dealer)
    # ディーラーの得点を表示
    gameManager.show_score(gameManager.dealer)
    # ディーラーは17点以上になるまで引き続ける
    while gameManager.dealer.score < 17
        gameManager.draw(gameManager.dealer)
        gameManager.calc_score(gameManager.dealer)
        gameManager.delete_card
        gameManager.show_card(gameManager.dealer)
    end
    # 勝敗判定
    gameManager.judge
end
gameManager.exit
