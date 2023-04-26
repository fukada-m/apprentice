# frozen_string_literal: true

require_relative 'game_actor'

class Cpu < GameActor
  def does_cpu_wants_next_card?
    separate_processing_by_name?
  end

  private

  def separate_processing_by_name?
    case name
    when 'CPU1' then true if score < 15
    when 'CPU2' then true if score < 19
    end
  end
end
