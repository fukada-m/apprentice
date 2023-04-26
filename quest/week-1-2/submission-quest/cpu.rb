# frozen_string_literal: true

require_relative 'participant'

# CPU特有の機能を定義したクラスです。
class Cpu < Participant
  private

  def want_next_card?
    case name
    when 'CPU1' then true if score < 15
    when 'CPU2' then true if score < 19
    end
  end
end
