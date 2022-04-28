require 'gosu'
require_relative "snake"
require_relative "food"
require "pry-byebug"
require_relative 'constants'
require_relative 'controller'


class GameWindow < Gosu::Window
  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT, false, 300)
    self.caption = "Snake Game"
    @controller = controller.new
  end

  def update
    @snake.move!
    game_restart if @snake.stuck?
    game_restart unless @snake.head_position.in_rect?(Position.new, Position.new(WINDOW_WIDTH, WINDOW_HEIGHT))
    got_food! if @snake.head_position == @food.position
  end

  def draw
    @snake.show(self)
    @food.show(self)
  end

  def button_down(button)
    super
    case button
    when Gosu::KbLeft then @snake.turn!(Direction.new(Direction::LEFT))
    when Gosu::KbRight then @snake.turn!(Direction.new(Direction::RIGHT))
    when Gosu::KbUp then @snake.turn!(Direction.new(Direction::UP))
    when Gosu::KbDown then @snake.turn!(Direction.new(Direction::DOWN))
    end
  end

  def game_restart
    @snake = Snake.new(Position.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2))
    @food = Food.new(Position.new(0, 0), Position.new(WINDOW_WIDTH, WINDOW_HEIGHT), SNAKE_SIZE)
  end

  private

  def got_food!
    @food = Food.new(Position.new(0, 0), Position.new(WINDOW_WIDTH, WINDOW_HEIGHT), SNAKE_SIZE)
    @snake.got_food!
  end
end
