# frozen_string_literal: true

#Aを持っている際に得点が21点を超えた場合に処理をするモジュール
module AceHandling
  def process_with_ace
    return unless over21?

    change_ase_score if ace_count >= 1
  end

  def change_ase_score
    puts '21点を超えたのでAを1点として扱います。'
    self.score -= 10
    self.ace_count -= 1
    show_score
  end
end
