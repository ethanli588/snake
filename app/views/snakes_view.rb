class SnakesView
  def show_in_window(snake_repository, window)
    snakes = snake_repository.all
    snakes.each do |snake|
      Paint.squre_in_window(left_up: snake.head_position, size: SNAKE_SIZE, color: Gosu::Color::WHITE)
      snake.body_positions.each do |position|
        left_up = position.move_towards!(RIGHT, (SNAKE_SIZE - BODY_SIZE) / 2).move_towards(DOWN, (SNAKE_SIZE - BODY_SIZE) / 2)
        Paint.squre_in_window(window: window, leftup: left_up, size: BODY_SIZE, color: Gosu::Color::YELLOW)
      end
    end
  end

  private

end
