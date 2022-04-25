require 'gosu'

LEFT = 0
UP = 1
RIGHT = 2
DOWN = 3
SNAKE_SIZE = 20
BODY_SIZE = 10
X = 0
Y = 1

class Snake
  attr_reader :head_position

  def initialize(position)
    @direction = LEFT
    @has_body = false
    @head_position = position
    @body_positions = Array.new
  end

  def move

    new_head_position = [@head_position[X], @head_position[Y]]
    case @direction
    when LEFT
      new_head_position[X] -= 1
    when RIGHT
      new_head_position[X] += 1
    when DOWN
      new_head_position[Y] += 1
    when UP
      new_head_position[Y] -= 1
    end
    if @has_body
      @body_positions.each { |position| return false if position == new_head_position }
      @body_positions.pop
      @body_positions.unshift(new_head_position)
    end
    @head_position = [new_head_position[X], new_head_position[Y]]
    return true
  end

  def draw(window)
    window.draw_rect(@head_position[X], @head_position[Y], SNAKE_SIZE, SNAKE_SIZE, Gosu::Color::WHITE)
    @body_positions.each { |position| window.draw_rect(position[X], position[Y], SNAKE_SIZE, SNAKE_SIZE, Gosu::Color::YELLOW) }
  end

  def self.oppsite_direction?(x_direction, y_direction)
    return true if [x_direction, y_direction].include?(LEFT) && [x_direction, y_direction].include?(RIGHT)

    return true if [x_direction, y_direction].include?(UP) && [x_direction, y_direction].include?(DOWN)

    return false
  end

  def turn(new_direction)
    return false if Snake.oppsite_direction?(new_direction, @direction)

    @direction = new_direction
    return true
  end


  def expand
    @body_positions.push(head_position)
    @has_body = true
  end

end


# snake = Snake.new([320, 240])
