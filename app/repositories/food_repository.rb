class FoodRepository
  def initialize
    @foods = []
    @foods << Food.new(Position.new(0, 0), Position.new(WINDOW_WIDTH, WINDOW_HEIGHT), SNAKE_SIZ)
  end

  def all
    @foods
  end

  def new_food_at(index)
    @foods[index] = Food.new(Position.new(0, 0), Position.new(WINDOW_WIDTH, WINDOW_HEIGHT), SNAKE_SIZ)
  end
end
