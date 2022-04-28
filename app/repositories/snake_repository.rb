class SnakeRepository
  def initialize
    @snakes = []
    @snakes << Snake.new(Position.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2))
  end

  def move
    @snakes.each { |snake| snake.move! }
  end
