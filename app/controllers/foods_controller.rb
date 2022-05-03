require_relative '../repositories/food_repository'

class FoodsController
  def initialize(food_repository, snake_repository)
    @food_repository = food_repository
    @snake_repository = snake_repository
  end

  def show_in_window(window)
    @foods_view.show_in_window(food_repository, window)
  end
end
