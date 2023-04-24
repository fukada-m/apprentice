# frozen_string_literal: true

require_relative 'human'

# ユーザー特有の操作を定義したクラスです。
class Player < Human
  attr_accessor :answer

  def initialize(name)
    super(name)
    @answer = ''
  end

  def do_you_want_next_card?
    do_you_want_nest_card
    check_your_answer?
  rescue StandardError
    puts 'YかNで入力してください'
    retry
  end

  private

  def do_you_want_nest_card
    puts 'カードを引きますか？（Y/N）'
    self.answer = gets.upcase
  end

  def check_your_answer?
    if answer == "Y\n"
      true
    elsif answer == "N\n"
      false
    else
      raise
    end
  end
end
