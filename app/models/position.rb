require 'pry-byebug'
require 'active_record'
require_relative '../../data/constants'
require_relative 'direction'

class Position < ActiveRecord::Base
  # attr_accessor :x, :y

  # def initialize(position_x = 0, position_y = 0)
  #   self.x = position_x
  #   self.y = position_y
  # end

  def self.rand_position_in_rect(top_left, bottom_right)
    # byebug
    Position.new(x: rand((top_left.x)..(bottom_right.x)), y: rand((top_left.y)..(bottom_right.y)))
  end

  def copy!(position)
    self.x = position.x
    self.y = position.y
  end

  def from_array!(a)
    self.x = a[0]
    self.y = a[1]
  end

  def to_a
    return [x, y]
  end

  def ==(other)
    return self.x == other.x && self.y == other.y
  end

  def >(other)
    return self.x > other.x && self.y > other.y
  end

  def <(other)
    return self.x < other.x && self.y < other.y
  end

  def >=(other)
    return self.x >= other.x && self.y >= other.y
  end

  def <=(other)
    return self.x <= other.x && self.y <= other.y
  end

  def move_towards(direction, steps = 1)
    new_postion = dup
    new_postion.move_towards!(direction, steps)
    return new_postion
  end

  def move_towards!(direction, steps = 1)
    # byebug
    case direction.towards

    when Direction::LEFT then self.x -= steps
    when Direction::RIGHT then self.x += steps
    when Direction::DOWN then self.y += steps
    when Direction::UP then self.y -= steps
    end
  end

  def equals?(position)
    return self.x == position.x && self.y == position.y
  end

  def on_left_of?(position, steps = 1)
    return self.x == position.x - steps && self.y == position.y
  end

  def on_right_of?(position, steps = 1)
    return self.x == position.x + steps && self.y == position.y
  end

  def above?(position, steps = 1)
    return self.x == position.x && self.y == position.y - steps
  end

  def below?(position, steps = 1)
    return self.x == position.x && self.y == position.y - steps
  end

  def in_rect?(top_left, bottom_right)
    return self >= top_left && self <= bottom_right
  end
end
