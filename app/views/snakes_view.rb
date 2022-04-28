class snakes_view

  def show_in_window(snake_repository, window)
    snakes = snake_repository.all
    snakes.each do |snake|
      window.draw_rect(snake.head_position.x, snake.head_position.y, SNAKE_SIZE, SNAKE_SIZE, Gosu::Color::WHITE)
      snake.body_positions.each { |position| window.draw_rect(position.x+ (SNAKE_SIZE - BODY_SIZE) / 2, position.y + (SNAKE_SIZE - BODY_SIZE) / 2, BODY_SIZE, BODY_SIZE, Gosu::Color::YELLOW) }
    end
  end



  private

end
