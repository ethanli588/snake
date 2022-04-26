require_relative "constants"

class Position
  attr_accessor :x, :y

  def initialize(position_x, position_y)
    @x = x
    @y = y
  end

  def copy!(position)
    @x = position.x
    @y = position.y
  end

  def move_towards!(direction, steps = 1)
    case direction
    when LEFT then @x -= steps
    when RIGHT then @x += steps
    when DOWN then @y += steps
    when UP then @y -= steps
    end
  end

  def move_towards(direction, steps = 1)
    new_postion = Position.new(@x, @y)
    new_postion.move_towards!(direction, steps)
    return new_postion
  end

  def equals?(position)
    return @x == position.x && @y == position.y
  end

  def on_left_of?(position, steps)
  end

  def on_right_of?
  end

  def above?
  end

end

Position.new(12,13)
