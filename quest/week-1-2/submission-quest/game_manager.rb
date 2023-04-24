# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'cpu'

# ゲーム全体の進行を管理するクラス
class GameManager
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
    deck.create_deck
    # それぞれのプレイヤーが2枚ずつカードを引いて公開する
    participants.each { |participant| 2.times { draw_and_show_cards(participant) } }
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

    # CPU1にも聞く
    while does_cpu_wants_next_card?(cpu1)
      draw_and_show_cards(cpu1)
      burst_processing(cpu1)
      break if over21?(cpu1)
    end
    show_score(cpu1) unless over21?(cpu1)

    # CPU2にも聞く
    while does_cpu_wants_next_card?(cpu2)
      draw_and_show_cards(cpu2)
      burst_processing(cpu2)
      break if over21?(cpu2)
    end
    show_score(cpu2) unless over21?(cpu2)

    open_card_no_2
    show_score(dealer)

    # ディーラーにも聞く
    while dose_dealer_wnants_next_card?
      draw_and_show_cards(dealer)
      burst_processing(dealer)
      break if over21?(dealer)
    end
    judge
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

  def does_cpu_wants_next_card?(cpu)
    cpu.does_cpu_wants_next_card?
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
    puts "しかし、#{human.name}はAをもっていました。Aを1点として扱います"
    human.show_score
  end

  def judge
    puts '最終判定をします。'
    player.score = 0 if over21?(player)
    cpu1.score = 0 if over21?(cpu1)
    cpu2.score = 0 if over21?(cpu2)
    dealer.score = 0 if over21?(dealer)
    show_score(player)
    show_score(cpu1)
    show_score(cpu2)
    show_score(dealer)

    if player.score >= cpu1.score && player.score >= cpu2.score && player.score >= dealer.score
      puts 'あなたの勝ちです!'
    elsif cpu1.score >= cpu2.score && cpu1.score >= dealer.score
      puts 'CPU1の勝ちです。'
    elsif cpu2.score >= dealer.score
      puts 'CPU2の勝ちです。'
    else
      puts 'ディーラーの勝ちです。'
    end
  end
end
