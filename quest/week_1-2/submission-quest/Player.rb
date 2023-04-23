# frozen_string_literal: true

require_relative 'human'

class Player < Human
  attr_accessor :answer

  def initialize(name)
    super(name)
    @answer = ''
  end

  def do_you_want_next_card?
    do_you_want_nest_card
    check_your_answer?
  end

  private

  def do_you_want_nest_card
    puts 'カードを引きますか？（Y/N）'
    self.answer = gets
  end

  def check_your_answer?
    true if answer == "Y\n"
  end
end
