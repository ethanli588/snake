require_relative "game_window"
require "pry-byebug"

game_window = GameWindow.new(snakes_controller, foods_controller)
game_window.show
