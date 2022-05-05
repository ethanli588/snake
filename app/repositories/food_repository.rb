require_relative '../models/food'
require_relative '../models/position'


class FoodRepository
  def initialize
    @foods = []
    @foods << Food.new(Position.new(x: 0, y: 0), Position.new(x: WINDOW_WIDTH, y: WINDOW_HEIGHT), SNAKE_SIZE)
  end

  def restart
    @foods.clear
    @foods << Food.new(Position.new(x: 0, y: 0), Position.new(x: WINDOW_WIDTH, y: WINDOW_HEIGHT), SNAKE_SIZE)
  end
  def all
    @foods
  end

  def new_food_at(index)
    @foods[index] = Food.new(Position.new(x: 0, y: 0), Position.new(x: WINDOW_WIDTH, y: WINDOW_HEIGHT), SNAKE_SIZE)
  end
end
