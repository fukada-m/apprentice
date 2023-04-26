# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'cpu'
require_relative 'judge'

# ゲーム全体の進行を管理するクラス
class Game
  attr_reader :deck, :player, :dealer, :cpu1, :cpu2, :participants
  include Judge

  def initialize
    @deck = Deck.new
    @player = Player.new('あなた')
    @dealer = Dealer.new('ディーラー')
    @cpu1 = Cpu.new('CPU1')
    @cpu2 = Cpu.new('CPU2')
    @participants = [player, cpu1, cpu2]
  end

  def start
    puts 'ブラックジャックを開始します'
    create_deck
    pull_two_cards_each_player
    show_score(player)
  end

  def ask_all_players_to_draw_a_card
    ask_player_to_draw_card(player)
    ask_cpu_to_draw_card(cpu1)
    ask_cpu_to_draw_card(cpu2)
    open_card_no2
    show_score(dealer)
    ask_dealer_to_draw_card
  end

  def victory_judge
    puts '最終判定をします。'
    judge
  end

  def end
    puts 'ブラックジャックを終了します'
  end

  private

  def create_deck
    deck.build_deck
  end

  def pull_two_cards_each_player
    participants.each { |participant| 2.times { draw_and_show_cards(participant) } }
    draw_and_show_cards(dealer)
    draw_and_hide_cards
  end

  def ask_player_to_draw_card(player)
    while do_you_want_next_card?
      draw_and_show_cards(player)
      show_score(player)
      burst_processing(player)
      break if over21?(player)
    end
    return if over21?(player)
    
  end

  def ask_cpu_to_draw_card(cpu)
    while does_cpu_wants_next_card?(cpu)
      draw_and_show_cards(cpu)
      burst_processing(cpu)
      break if over21?(cpu)
    end
    show_score(cpu) unless over21?(cpu)
  end

  def ask_dealer_to_draw_card
    while dose_dealer_wnants_next_card?
      draw_and_show_cards(dealer)
      burst_processing(dealer)
      break if over21?(dealer)
    end
  end

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

  def does_cpu_wants_next_card?(cpu)
    cpu.does_cpu_wants_next_card?
  end

  def over21?(human)
    human.over21?
  end

  def open_card_no2
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
    puts "しかし、#{human.name}はAをもっていました。Aを1点として扱います"
    human.show_score
  end

  
end
