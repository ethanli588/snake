require_relative '../model/snake'
require_relative '../model/position'
require_relative '../model/direction'

class SnakesController
  def initialize
    @snake_repository = SnakeRepository.new
    @food_repository = FoodRepository.new
    @snakes_view = SnakesView.new
    @foods_view = FoodsView.new
  end

  def move
    @snake_repository.move
  end

  def in_trap?
    @snake_repository.ch
  end

  def show_in_window(window)
    @snakes_view.show_in_window(snake_repository, window)
  end

  got_food! if @snake.head_position == @food.position

  game_restart if @snake.stuck?
    game_restart unless @snake.head_position.in_rect?(Position.new, Position.new(WINDOW_WIDTH, WINDOW_HEIGHT))


end
