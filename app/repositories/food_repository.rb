require_relative '../models/food'
require_relative '../models/position'
# require_relative '../../data/constants'


class FoodRepository
  def initialize
    @foods = []
    @foods << Food.new(Position.new(0, 0), Position.new(WINDOW_WIDTH, WINDOW_HEIGHT), SNAKE_SIZE)
  end

  def all
    @foods
  end

  def new_food_at(index)
    @foods[index] = Food.new(Position.new(0, 0), Position.new(WINDOW_WIDTH, WINDOW_HEIGHT), SNAKE_SIZE)
  end
end
