require_relative "snake"

class Food
  attr_reader :position

  def initialize(window_size)
    @position = [rand(window_size[X]), rand(window_size[Y])]
  end

  def draw(window)
    window.draw_rect(@position[X], @position[Y], SNAKE_SIZE, SNAKE_SIZE, Gosu::Color::RED)
  end
end
