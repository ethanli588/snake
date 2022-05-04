require_relative '../../data/constants'
require_relative "direction"
require 'pry-byebug'

class Position
  attr_accessor :x, :y

  def initialize(position_x = 0, position_y = 0)
    @x = position_x
    @y = position_y
  end

  def self.rand_position_in_rect(top_left, bottom_right)
    # byebug
    Position.new(rand((top_left.x)..(bottom_right.x)), rand((top_left.y)..(bottom_right.y)))
  end

  def copy!(position)
    @x = position.x
    @y = position.y
  end

  def from_array!(a)
    @x = a[0]
    @y = a[1]
  end

  def to_a
    return [x, y]
  end

  def ==(other)
    return @x == other.x && @y == other.y
  end

  def >(other)
    return @x > other.x && @y > other.y
  end

  def <(other)
    return @x < other.x && @y < other.y
  end

  def >=(other)
    return @x >= other.x && @y >= other.y
  end

  def <=(other)
    return @x <= other.x && @y <= other.y
  end

  def move_towards(direction, steps = 1)
    new_postion = Position.new(@x, @y)
    new_postion.move_towards!(direction, steps)
    return new_postion
  end

  def move_towards!(direction, steps = 1)
    case direction.towards
    when Direction::LEFT then @x -= steps
    when Direction::RIGHT then @x += steps
    when Direction::DOWN then @y += steps
    when Direction::UP then @y -= steps
    end
  end

  def equals?(position)
    return @x == position.x && @y == position.y
  end

  def on_left_of?(position, steps = 1)
    return @x == position.x - steps && @y == position.y
  end

  def on_right_of?(position, steps = 1)
    return @x == position.x + steps && @y == position.y
  end

  def above?(position, steps = 1)
    return @x == position.x && @y == position.y - steps
  end

  def below?(position, steps = 1)
    return @x == position.x && @y == position.y - steps
  end

  def in_rect?(top_left, bottom_right)
    return self >= top_left && self <= bottom_right
  end

end
