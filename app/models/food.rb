require_relative 'snake'
require 'pry-byebug'
require_relative 'position'

class Food
  attr_reader :position, :food_size

  def initialize(up_left, bottom_right, size)
    # byebug
    @position = Position.rand_position_in_rect(up_left, bottom_right)
    position_to_a_grid!(size)
    @food_size = size
  end

  def position_to_a_grid!(grid_size)
    @position.x = @position.x / grid_size * grid_size
    @position.y = @position.y / grid_size * grid_size
  end

  def show(window)
    window.draw_rect(@position.x, @position.y, @food_size, @food_size, Gosu::Color::RED)
  end
end
