require_relative '../models/snake'
require_relative '../models/position'
require_relative '../models/direction'
require_relative '../views/snakes_view'


class SnakesController
  def initialize(snake_repository, food_repository)
    @snake_repository = snake_repository
    @food_repository = food_repository
    @snakes_view = SnakesView.new
  end

  def move
    @snake_repository.move
  end

  def in_trap?
    @snake_repository.snakes_stuck?
  end

  def show_in_window(window)
    @snakes_view.show_in_window(@snake_repository, window)
  end

  def return_two_index_if_got_food
    snakes = @snake_repository.all
    foods = @food_repository.all
    snakes.each_with_index do |snake, snake_index|
      foods.each_with_index do |food, food_index|
        return { snake_index: snake_index, food_index: food_index } if snake.head_position == food.position
      end
    end
    nil
  end

  def expand_at(index)
    @snake_repository.expand_at(index)
  end

  # got_food! if @snake.head_position == @food.position

  # game_restart unless @snake.head_position.in_rect?(Position.new, Position.new(WINDOW_WIDTH, WINDOW_HEIGHT))

  def turn_left
    turn(Direction.new(Direction::LEFT))
  end

  def turn_right
    turn(Direction.new(Direction::RIGHT))
  end

  def turn_up
    turn(Direction.new(Direction::UP))
  end

  def turn_down
    turn(Direction.new(Direction::DOWN))
  end

  private

  def turn(position)
    @snake_repository.turn_active_snake(position)
  end
end
