class FoodsView
  def initialize
  end

  def show_in_window(food_repository, window)
    foods = food_repository.all
    foods.each do |food|
      Paint.squre_in_window(window: window, top_left: food.position, size: food.food_size, color: Gosu::Color::YELLOW)
    end
  end
end
