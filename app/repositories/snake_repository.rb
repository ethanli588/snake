require_relative '../models/snake'
require_relative '../models/position'

class SnakeRepository
  def initialize
    @snakes = []
    @snakes << Snake.new(Position.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2))
    @active_snake_index = 0
  end

  def restart
    @snakes.clear
    @snakes << Snake.new(Position.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2))
  end

  def move
    @snakes.each { |snake| snake.move! }
  end

  def snakes_stuck?
    @snakes.each { |snake| return true if snake.stuck? }
    return false
  end

  def out_of_boundary?(width, height)
    @snakes.each do |snake|
      return true unless snake.head_position.in_rect?(Position.new(0, 0), Position.new(width, height))
    end
    return false
  end

  def all
    @snakes
  end

  def expand_at(index)
    @snakes[index].expand!
  end

  def turn_active_snake(direction)
    @snakes[@active_snake_index].turn!(direction)
  end
end
