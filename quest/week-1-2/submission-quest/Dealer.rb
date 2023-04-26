# frozen_string_literal: true

require_relative 'game_actor'

# ディーラー特有の機能を定義したクラスです。
class Dealer < GameActor
  def draw_and_hide_cards(deck)
    draw_a_card(deck)
    calc_score
    hide_card
  end

  def dose_dealer_wnants_next_card?
    true if score < 17
  end

  def open_card_no_2
    puts "ディーラーの引いた2枚目のカードは#{hand[0]}でした。"
  end

  private

  def hide_card
    puts 'ディーラーの引いた2枚目のカードはわかりません。'
  end
end
