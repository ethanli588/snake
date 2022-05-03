class SnakeRepository
  def initialize
    @snakes = []
    @snakes << Snake.new(Position.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2))
  end

  def move
    @snakes.each { |snake| snake.move! }
  end

  def snakes_stuck?
    @snakes.each { |snake| return true if snake.stuck? }
    return false
  end

  def all
    @snakes
  end

  def expand_at(index)
    @snakes[index].expand!
  end
end
