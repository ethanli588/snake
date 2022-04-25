require 'gosu'
require_relative "snake"
require_relative "food"

WINDOW_WIDTH = 640
WINDOW_HEIGHT = 320
class Game < Gosu::Window
  def initialize
    super WINDOW_WIDTH, WINDOW_HEIGHT
    self.caption = "Snake Game"
    @snake = Snake.new([WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2])
    @food = Food.new([WINDOW_WIDTH, WINDOW_HEIGHT])
  end

  def update
    game_over unless @snake.move
    game_over unless @snake.head_position[X].between?(0, WINDOW_WIDTH) && @snake.head_position[Y].between?(0, WINDOW_HEIGHT)
    if @snake.head_position == @food.position
      @food = Food.new([WINDOW_WIDTH, WINDOW_HEIGHT])
      @snake.expand
    end
    direction_update
  end

  def draw
    @snake.draw(self)
    @food.draw(self)
  end

  def direction_update
    case
    when button_down?(Gosu::KbRight) then @snake.turn(RIGHT)
    when button_down?(Gosu::KbLeft) then @snake.turn(LEFT)
    when button_down?(Gosu::KbUp) then @snake.turn(UP)
    when button_down?(Gosu::KbDown) then @snake.turn(DOWN)
    end
  end

  def game_over
    p @snake.head_position
    close()
  end

end

Game.new.show
