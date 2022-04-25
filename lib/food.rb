require_relative "snake"
require "pry-byebug"

class Food
  attr_reader :position

  def initialize(window_size)
    @position = [rand(window_size[X] / SNAKE_SIZE) * SNAKE_SIZE, rand(window_size[Y] / SNAKE_SIZE) * SNAKE_SIZE]
  end

  def draw(window)
    window.draw_rect(@position[X], @position[Y], SNAKE_SIZE, SNAKE_SIZE, Gosu::Color::RED)
  end
end
