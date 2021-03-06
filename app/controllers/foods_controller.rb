# require_relative '../repositories/food_repository'
require_relative '../views/foods_view'

class FoodsController
  def initialize(food_repository, snake_repository)
    @food_repository = food_repository
    @snake_repository = snake_repository
    @foods_view = FoodsView.new
  end

  def restart
    @food_repository.restart
  end

  def show_in_window(window)
    @foods_view.show_in_window(@food_repository, window)
  end

  def new_food_at(index)
    @food_repository.new_food_at(index)
  end
end
