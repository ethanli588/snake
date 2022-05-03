require_relative "game_window"
require "pry-byebug"
require_relative "controllers/foods_controller"
require_relative "controllers/snakes_controller"
require_relative "repositories/snake_repository"
require_relative "repositories/food_repository"

snake_repository = SnakeRepository.new
food_repository = FoodRepository.new

snakes_controller = SnakesController.new(snake_repository, food_repository)
foods_controller = FoodsController.new(food_repository, snake_repository)

game_window = GameWindow.new(snakes_controller, foods_controller)
game_window.show
