# frozen_string_literal: true

# 勝敗を判定するモジュール
module Judge
  private

  def judge
    player.score = 0 if player.over21?
    cpu1.score = 0 if cpu1.over21?
    cpu2.score = 0 if cpu2.over21?
    dealer.score = 0 if dealer.over21?
    player.show_score
    cpu1.show_score
    cpu2.show_score
    dealer.show_score

    if player.score >= cpu1.score && player.score >= cpu2.score && player.score >= dealer.score
      puts 'あなたの勝ちです!'
    elsif cpu1.score >= cpu2.score && cpu1.score >= dealer.score
      puts 'CPU1の勝ちです。'
    elsif cpu2.score >= dealer.score
      puts 'CPU2の勝ちです。'
    else
      puts 'ディーラーの勝ちです。'
    end
  end
end
