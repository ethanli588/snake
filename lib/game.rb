require 'gosu'
require_relative "snake"
require_relative "food"
require "pry-byebug"

WINDOW_WIDTH = 600
WINDOW_HEIGHT = 600
class Game < Gosu::Window
  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT, false, 300)
    self.caption = "Snake Game"
    @snake = Snake.new([WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2])
    @food = Food.new([WINDOW_WIDTH, WINDOW_HEIGHT])
  end

  def update
    game_restart unless @snake.move
    # byebug
    game_restart unless @snake.head_position[X].between?(0, WINDOW_WIDTH) && @snake.head_position[Y].between?(0, WINDOW_HEIGHT)
    if @snake.head_position == @food.position
      @food = Food.new([WINDOW_WIDTH, WINDOW_HEIGHT])
      @snake.expand
    end
    # direction_update
  end

  def draw
    @snake.draw(self)
    @food.draw(self)
  end

  def button_down(button)
    super
    case button
    when Gosu::KbLeft then @snake.turn(LEFT)
    when Gosu::KbRight then @snake.turn(RIGHT)
    when Gosu::KbUp then @snake.turn(UP)
    when Gosu::KbDown then @snake.turn(DOWN)
    end
  end

  # def direction_update
  #   case
  #   when button_down?(Gosu::KbRight) then @snake.turn(RIGHT)
  #   when button_down?(Gosu::KbLeft) then @snake.turn(LEFT)
  #   when button_down?(Gosu::KbUp) then @snake.turn(UP)
  #   when button_down?(Gosu::KbDown) then @snake.turn(DOWN)
  #   end
  # end

  def game_restart
    @snake = Snake.new([WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2])
    @food = Food.new([WINDOW_WIDTH, WINDOW_HEIGHT])
  end

end

Game.new.show
