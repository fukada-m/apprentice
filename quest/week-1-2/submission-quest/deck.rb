# frozen_string_literal: true

# デッキの作成、カードの削除ができます。
class Deck
  attr_accessor :deck

  def initialize
    @deck = []
  end

  def build_deck
    create_card
    shuffle
  end

  def delete_top_card
    deck.delete_at(0)
  end

  private

  def create_card
    4.times do |index|
      mark = %w[ハート ダイヤ スペード クローバー]
      13.times do |num|
        deck.push(["#{mark[index]}の#{num + 1}", num + 1])
      end
    end
  end

  def shuffle
    self.deck = deck.shuffle
  end
end
