require 'gosu'
require_relative 'app/models/snake'
require_relative 'app/models/food'
require 'pry-byebug'
require_relative 'data/constants'
require_relative "config/application"

# require_relative 'controller'

class GameWindow < Gosu::Window
  def initialize(snakes_controller, foods_controller)
    super(WINDOW_WIDTH, WINDOW_HEIGHT, false, 300)
    self.caption = 'Snake Game'
    @snakes_controller = snakes_controller
    @foods_controller = foods_controller
  end

  def update
    @snakes_controller.move
    game_restart if @snakes_controller.in_trap? || @snakes_controller.out_of_boundary?(self)
    indexs = @snakes_controller.return_two_index_if_got_food
    if indexs
      # byebug
      @snakes_controller.expand_at(indexs[:snake_index])
      @foods_controller.new_food_at(indexs[:food_index])
    end
  end

  def draw
    @snakes_controller.show_in_window(self)
    @foods_controller.show_in_window(self)
  end

  def button_down(button)
    super
    case button
    when Gosu::KbLeft then @snakes_controller.turn_left
    when Gosu::KbRight then @snakes_controller.turn_right
    when Gosu::KbUp then @snakes_controller.turn_up
    when Gosu::KbDown then @snakes_controller.turn_down
    end
  end

  def game_restart
    @snakes_controller.restart
    @foods_controller.restart
  end

  private

  def got_food!
    @food = Food.new(Position.new(x: 0, y: 0), Position.new(x: WINDOW_WIDTH, y: WINDOW_HEIGHT), SNAKE_SIZE)
    @snake.got_food!
  end
end
