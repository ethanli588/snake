require 'gosu'
require_relative '../../data/constants'
require_relative 'position'
require_relative 'direction'
require 'pry-byebug'

class Snake
  attr_reader :head_position, :body_positions

  def initialize(position)
    @direction = Direction.new
    @head_position = position
    @body_positions = []
  end

  def body?
    !@body_positions.empty?
  end

  def stuck?
    return false if @body_positions[0] == @head_position

    @body_positions.include?(@head_position)
  end

  def move!
    # byebug
    move_body! if body?
    @head_position.move_towards!(@direction, SNAKE_SIZE)
  end

  def turn!(new_direction)
    @direction.turn_to!(new_direction) unless @direction.oppsite?(new_direction)
  end

  def expand!
    @body_positions.push(@head_position.dup)
  end

  private

  def move_body!
    @body_positions.unshift(@head_position.dup)
    @body_positions.pop
  end

end


# snake = Snake.new([320, 240])
