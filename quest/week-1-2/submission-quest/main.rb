# frozen_string_literal: true

require_relative 'game'
require 'debug'
require 'pry-byebug'

game = Game.new
game.start
game.ask_all_players_to_draw_a_card
game.victory_judge
game.end
