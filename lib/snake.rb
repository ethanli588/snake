require 'gosu'
require_relative 'constants'

class Snake
  attr_reader :head_position

  def initialize(position)
    @direction = LEFT
    @has_body = false
    @head_position = position
    @body_positions = []
  end

  def move

    new_head_position = [@head_position[X], @head_position[Y]]
    case @direction
    when LEFT
      new_head_position[X] -= SNAKE_SIZE
    when RIGHT
      new_head_position[X] += SNAKE_SIZE
    when DOWN
      new_head_position[Y] += SNAKE_SIZE
    when UP
      new_head_position[Y] -= SNAKE_SIZE
    end
    if @has_body
      @body_positions.each { |position| return false if position == new_head_position }
      @body_positions.pop
      @body_positions.unshift(@head_position)
    end
    @head_position = [new_head_position[X], new_head_position[Y]]
    true
  end

  def draw(window)
    window.draw_rect(@head_position[X], @head_position[Y], SNAKE_SIZE, SNAKE_SIZE, Gosu::Color::WHITE)
    @body_positions.each { |position| window.draw_rect(position[X] + (SNAKE_SIZE - BODY_SIZE) / 2, position[Y] + (SNAKE_SIZE - BODY_SIZE) / 2, BODY_SIZE, BODY_SIZE, Gosu::Color::YELLOW) }
  end

  def self.oppsite_direction?(x_direction, y_direction)
    return true if [x_direction, y_direction].include?(LEFT) && [x_direction, y_direction].include?(RIGHT)

    return true if [x_direction, y_direction].include?(UP) && [x_direction, y_direction].include?(DOWN)

    false
  end

  def turn(new_direction)
    return false if Snake.oppsite_direction?(new_direction, @direction)

    @direction = new_direction
    true
  end


  def expand
    @body_positions.push(head_position)
    @has_body = true
  end

end


# snake = Snake.new([320, 240])
