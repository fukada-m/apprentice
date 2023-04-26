# frozen_string_literal: true

# デッキの作成、Aのチェック、カードの削除ができます。
class Deck
  attr_accessor :deck

  def initialize
    @deck = []
  end

  def build_deck
    create_cards
    shuffle
  end

  def delete_card
    deck.delete_at(0)
  end

  def check_a?
    true if deck[0][1] == 1
  end

  private

  def create_cards
    4.times do |index|
      mark = %w[ハート ダイヤ スペード クローバー]
      13.times do |num|
        # 例　["ハートの2", 2]
        deck.push(["#{mark[index]}の#{num + 1}", num + 1])
      end
    end
  end

  def shuffle
    self.deck = deck.shuffle
  end
end
