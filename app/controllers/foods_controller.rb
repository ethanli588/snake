class FoodsController
  def initialize
    @food = Food.new(Position.new(0, 0), Position.new(WINDOW_WIDTH, WINDOW_HEIGHT), SNAKE_SIZE)
  end

  def update
    @snake.move!
    game_restart if @snake.stuck?
    game_restart unless @snake.head_position.in_rect?(Position.new, Position.new(WINDOW_WIDTH, WINDOW_HEIGHT))
    got_food! if @snake.head_position == @food.position
  end
end