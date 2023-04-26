# frozen_string_literal: true

require_relative 'participant'

# ディーラー特有の機能を定義したクラスです。
class Dealer < Participant
  def draw_and_hide_card(deck)
    draw_card(deck)
    calc_score
    hide_card
    delete_top_card(deck)
  end

  def ask_to_draw_card(deck)
    open_card_no2
    super
  end

  def want_next_card?
    true if score < 17
  end

  private

  def hide_card
    puts 'ディーラーの引いた2枚目のカードはわかりません。'
  end

  def open_card_no2
    puts "ディーラーの引いた2枚目のカードは#{hand[0]}でした。"
  end
end
