class Direction
  attr_reader :towards

  LEFT = 0
  UP = 1
  RIGHT = 2
  DOWN = 3

  def initialize(towards = LEFT)
    @towards = towards
  end

  def oppsite?(direction)
    return direction.u_turn == self
  end

  def u_turn
    new_direction = Direction.new(@towards)
    new_direction.u_turn!
    return new_direction
  end

  def u_turn!
    case @towards
    when LEFT then @towards = RIGHT
    when RIGHT then @towards = LEFT
    when UP then @towards = DOWN
    when DOWN then @towards = UP
    end
  end

  def ==(direction)
    return @towards == direction.towards
  end

  def turn_to!(direction)
    @towards = direction.towards
  end
end
