require_relative '../model/snake'
require_relative '../model/position'
require_relative '../model/direction'


class SnakesController
  def initialize(snake_repository, food_repository)
    @snake_repository = snake_repository
    @food_repository = food_repository
    # @food_repository = FoodRepository.new
    @snakes_view = SnakesView.new
  end

  def move
    @snake_repository.move
  end

  def in_trap?
    @snake_repository.snakes_stuck?
  end

  def show_in_window(window)
    @snakes_view.show_in_window(snake_repository, window)
  end

  def got_food?
    snakes = @snake_repository.all
    foods = @food_repository.all
    snakes.each do |snake|
      foods.each do |food|
        return true if snake.head_position == food.position
      end
    end
    return false
  end

  # got_food! if @snake.head_position == @food.position

  # game_restart unless @snake.head_position.in_rect?(Position.new, Position.new(WINDOW_WIDTH, WINDOW_HEIGHT))

end
