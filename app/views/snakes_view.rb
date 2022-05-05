require_relative "../models/paint"
require_relative "../models/direction"
require "pry-byebug"

class SnakesView
  def show_in_window(snake_repository, window)
    snakes = snake_repository.all
    snakes.each do |snake|
      Paint.squre_in_window(window: window, top_left: snake.head_position, size: SNAKE_SIZE, color: Gosu::Color::WHITE)
      snake.body_positions.each do |position|
        top_left = position.move_towards(Direction.right, (SNAKE_SIZE - BODY_SIZE) / 2).move_towards(Direction.down, (SNAKE_SIZE - BODY_SIZE) / 2)
        Paint.squre_in_window(window: window, top_left: top_left, size: BODY_SIZE, color: Gosu::Color::YELLOW)
      end
    end
  end
end
