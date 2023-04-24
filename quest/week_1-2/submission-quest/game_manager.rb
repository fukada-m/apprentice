# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'deck'

# ゲーム全体の進行を管理するクラス
class GameManager
  attr_reader :dealer, :player, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new('あなた')
    @dealer = Dealer.new('ディーラー')
  end

  def start
    puts 'ブラックジャックを開始します'
    deck.create_deck
    2.times do
      draw_and_show_cards(player)
    end
    draw_and_show_cards(dealer)
    draw_and_hide_cards
    show_score(player)
    # カードを引くのをやめるかバーストするまで引き続ける
    while do_you_want_next_card?
      draw_and_show_cards(player)
      show_score(player)
      burst_processing(player)
      break if over21?(player)
    end
    return if over21?(player)

    open_card_no_2
    show_score(dealer)
    # ディーラーは17点以上になるまで引き続ける
    while dose_dealer_wnants_next_card?
      draw_and_show_cards(dealer)
      burst_processing(dealer)
      break if over21?(dealer)
    end
    judge unless over21?(dealer)
  end

  def end
    puts 'ブラックジャックを終了します'
  end

  private

  def draw_and_show_cards(human)
    human.draw(deck)
    score_up(human) if check_a?
    deck.delete_card
  end

  def draw_and_hide_cards
    dealer.draw_and_hide_cards(deck)
    score_up(dealer) if check_a?
    deck.delete_card
  end

  def show_score(human)
    human.show_score
  end

  def do_you_want_next_card?
    player.do_you_want_next_card?
  end

  def dose_dealer_wnants_next_card?
    dealer.dose_dealer_wnants_next_card?
  end

  def over21?(human)
    human.over21?
  end

  def open_card_no_2
    dealer.open_card_no_2
  end

  def burst(human)
    human.burst
  end

  def burst_processing(human)
    return unless over21?(human)

    have_a?(human) ? score_down(human) : burst(human)
  end

  def check_a?
    deck.check_a?
  end

  def score_up(human)
    human.score_up
  end

  def have_a?(human)
    human.have_a?
  end

  def score_down(human)
    human.score_down
    puts 'しかし、あなたはAをもっていました。Aを1点として扱います'
    human.show_score
  end

  def judge
    show_score(player)
    show_score(dealer)
    if dealer.score > 21
      puts 'あなたの勝ちです!'
    elsif player.score == dealer.score
      puts '引き分けです。'
    elsif player.score > dealer.score
      puts 'あなたの勝ちです!'
    else
      puts 'あなたの負けです!'
    end
  end
end
