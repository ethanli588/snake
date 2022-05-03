require_relative "game_window"
require "pry-byebug"
require_relative "app/controllers/foods_controller"
require_relative "app/controllers/snakes_controller"
require_relative "app/repositories/snake_repository"
require_relative "app/repositories/food_repository"

snake_repository = SnakeRepository.new
food_repository = FoodRepository.new

snakes_controller = SnakesController.new(snake_repository, food_repository)
foods_controller = FoodsController.new(food_repository, snake_repository)

game_window = GameWindow.new(snakes_controller, foods_controller)
game_window.show
