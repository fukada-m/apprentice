# frozen_string_literal: true

# プレイヤーとディーラーの両方に共通する機能をまとめたスーパークラスです。
class Human
  attr_accessor :hand, :score, :count_of_a
  attr_reader :name

  def initialize(name)
    @name = name
    @hand = ''
    @count_of_a = 0
    @score = 0
  end

  def draw(deck)
    draw_a_card(deck)
    calc_score
    show_card
  end

  def show_score
    puts "#{name}の現在の得点は#{score}点です。"
  end

  def over21?
    return unless score > 21

    true
  end

  def burst
    puts "#{name}はバーストしました。得点は#{score}です。"
  end

  def score_up
    score_up_10
    count_of_a_up
  end

  def score_down
    score_down_10
    count_of_a_down
  end

  def have_a?
    true if count_of_a >= 1
  end

  private

  def draw_a_card(deck)
    self.hand = deck.deck[0]
  end

  def calc_score
    self.score += if hand[1] > 10
                    10
                  else
                    hand[1]
                  end
  end

  def show_card
    puts "#{name}の引いたカードは#{hand[0]}です。"
  end

  def score_up_10
    self.score += 10
  end

  def score_down_10
    self.score -= 10
  end

  def count_of_a_up
    self.count_of_a += 1
  end

  def count_of_a_down
    self.count_of_a -= 1
  end
end
