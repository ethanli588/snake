require_relative '../model/snake'
require_relative '../model/position'
require_relative '../model/direction'

class SnakesController
  def initialize
    @SnakeRepository = SnakeRepository.new
    @FoodRepository = FoodRepository.new
    @SnakesView = SnakesView.new
    @FoodsView = FoodsView.new
  end

  def move
    @SnakeRepository.move
  end

  def in_trap?
    @SnakeRepository.ch
  end

  def show_in_window(window)
    @Snakes

  end

  got_food! if @snake.head_position == @food.position

  game_restart if @snake.stuck?
    game_restart unless @snake.head_position.in_rect?(Position.new, Position.new(WINDOW_WIDTH, WINDOW_HEIGHT))


end
