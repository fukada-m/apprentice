# frozen_string_literal: true

require_relative 'participant'

# ユーザー特有の操作を定義したクラスです。
class Player < Participant
  attr_accessor :answer

  def initialize(name)
    super(name)
    @answer = ''
  end

  def ask_to_draw_card(deck)
    while want_next_card?
      draw_and_show_card(deck)
      show_score
      process_with_ace
      if over21?
        burst
        return
      end
    end
  end

  private

  def want_next_card?
    puts 'カードを引きますか？（Y/N）'
    self.answer = gets.chomp.upcase
    check_your_answer?
  rescue StandardError
    puts 'YかNで入力してください'
    retry
  end

  def check_your_answer?
    if answer == "Y"
      true
    elsif answer == "N"
      false
    else
      raise
    end
  end
end
