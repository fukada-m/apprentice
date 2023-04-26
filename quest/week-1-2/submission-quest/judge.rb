# frozen_string_literal: true

# 勝敗を判定するモジュール
module Judge
  def victory_judge
    puts '勝敗判定をします。'
    calc_final_score
    judge(calc_max_score)
  end

  private

  def calc_final_score
    [player, cpu1, cpu2, dealer].each do |participant|
      participant.score = 0 if participant.over21?
      participant.show_score
    end
  end

  def calc_max_score
    [player.score, cpu1.score, cpu2.score, dealer.score].max
  end

  def judge(max)
    case max
    when player.score then puts 'あなたの勝ちです!'
    when dealer.score then puts 'ディーラーの勝ちです。'
    when cpu1.score then puts 'CPU1の勝ちです。'
    when cpu2.score then puts 'CPU2の勝ちです。'

    end
  end
end
