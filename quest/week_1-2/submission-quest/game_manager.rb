require_relative "player"
require_relative "dealer"
require_relative "deck"
require_relative "rule_a"

class GameManager
    attr_reader :dealer, :player, :deck, :rule_A

    def initialize
        @deck = Deck.new
        @player = Player.new("あなた")
        @dealer = Dealer.new("ディーラー")
        @rule_A = Rule_A.new
    end

    public
    
    def start
        puts "ブラックジャックを開始します"
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
            if check_score?(player) 
                if have_A?(player)
                    score_down(player) 
                else
                    burst(player)
                    break
                end
            end
        end
        # プレイヤーがバーストしてたらこの処理は行わない
        unless check_score?(player)
            open_card_no_2
            show_score(dealer)
            # ディーラーは17点以上になるまで引き続ける
            while dose_dealer_wnants_next_card?
                draw_and_show_cards(dealer)
                # gameManager.score_down(gameManager.dealer) if gameManager.dealer.score > 21
            end
            judge
        end
    end

    def end
        puts "ブラックジャックを終了します"
    end

    private 
    
    def draw_and_show_cards(human)
        human.draw(deck.deck)
        score_up(human) if check_A?
        deck.delete_card
    end

    def draw_and_hide_cards
        dealer.draw_and_hide_cards(deck.deck)
        score_up(dealer) if check_A?
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
    def check_score?(human)
        human.check_score?
    end

    def open_card_no_2
        dealer.open_card_no_2
    end

    def burst(human)
        human.burst
    end

    def judge
        puts "あなたの得点は#{player.score}です。"
        puts "ディーラーの得点は#{dealer.score}です。"
        if dealer.score > 21 
            puts "ディーラーはバーストしました。"
            puts "あなたの勝ちです!"
        elsif player.score == dealer.score
            puts "引き分けです。" 
        elsif player.score > dealer.score
            puts "あなたの勝ちです!"
        else
            puts "あなたの負けです!"
        end
    end

    def check_A?
        rule_A.check_A?(deck.deck)
    end

    def score_up(human)
        human.score_up
    end

    def have_A?(human)
        human.have_A?
    end

    def score_down(human)
        human.score_down
        puts "しかし、あなたはAをもっていました。Aを1として扱います"
        human.show_score
    end

end
