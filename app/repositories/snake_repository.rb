require_relative '../models/snake'
require_relative '../models/position'
require 'pry-byebug'

class SnakeRepository
  def initialize
    @snakes = []
    # byebug
    @snakes << Snake.new(Position.new(x: WINDOW_WIDTH / 2, y: WINDOW_HEIGHT / 2))
    @active_snake_index = 0
  end

  def restart
    @snakes.clear
    @snakes << Snake.new(Position.new(x: WINDOW_WIDTH / 2, y: WINDOW_HEIGHT / 2))
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
      return true unless snake.head_position.in_rect?(Position.new(x: 0, y: 0), Position.new(x: width, y: height))
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
