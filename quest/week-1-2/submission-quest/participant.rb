# frozen_string_literal: true

require_relative 'ace_handling'

# ゲームの参加者たちが持つ基本的な機能と変数をまとめました。
class Participant
  include AceHandling
  attr_accessor :hand, :score, :ace_count
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = ''
    @ace_count = 0
    @score = 0
  end

  def ask_to_draw_card(deck)
    while want_next_card?
      draw_and_show_card(deck)
      process_with_ace
      if over21?
        burst
        return
      end
    end
  end

  def draw_and_show_card(deck)
    draw_card(deck)
    calc_score
    show_card
    delete_top_card(deck)
  end

  def show_score
    puts "#{name}の現在の得点は#{score}点です。"
  end

  def over21?
    true if score > 21
  end

  private

  def draw_card(deck)
    self.hand = deck.deck[0]
  end

  def calc_score
    self.score += if hand[1] > 10
                    10
                  elsif hand[1] == 1
                    self.ace_count += 1
                    11
                  else
                    hand[1]
                  end
  end

  def show_card
    puts "#{name}の引いたカードは#{hand[0]}です。"
  end

  def delete_top_card(deck)
    deck.delete_top_card
  end

  def want_next_card?
    raise 'メソッドを定義してください'
  end

  def burst
    puts "#{name}はバーストしました。得点は#{score}です。"
  end
end
