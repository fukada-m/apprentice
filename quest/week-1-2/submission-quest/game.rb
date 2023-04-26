# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'cpu'
require_relative 'judge'

# ゲーム全体の進行を管理するクラス
class Game
  include Judge
  attr_reader :deck, :player, :dealer, :cpu1, :cpu2, :participants

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
    build_deck
    pull_two_cards_each_player
    player.show_score
  end

  def ask_all_players_to_draw_a_card
    ask_player_to_draw_card
    ask_cpu_to_draw_card(cpu1)
    ask_cpu_to_draw_card(cpu2)
    ask_dealer_to_draw_card
  end

  def end
    puts 'ブラックジャックを終了します'
  end

  private

  def build_deck
    deck.build_deck
  end

  def pull_two_cards_each_player
    participants.each { |participant| 2.times { participant.draw_and_show_card(deck) } }
    dealer.draw_and_show_card(deck)
    dealer.draw_and_hide_card(deck)
  end

  def ask_player_to_draw_card
    player.ask_to_draw_card(deck)
  end

  def ask_cpu_to_draw_card(cpu)
    cpu.ask_to_draw_card(deck)
  end

  def ask_dealer_to_draw_card
    dealer.ask_to_draw_card(deck)
  end
end
