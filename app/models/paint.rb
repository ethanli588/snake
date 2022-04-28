class Paint
  def self.rect_in_window(attributes = {})
    window = attributes[:window]
    up_left = attributes[:up_left]
    bottom_right = attributes[:bottom_right]
    color = attributes[:color]
    window.draw_rect(up_left.x, up_left.y, bottom_right.x - up_left.x, bottom_right.y - up_left.y, color)
  end

  def self.squre_in_window(attributes = {})
    up_left = attributes[:up_left]
    size = attributes[:size]
    attributes[:bottom_right] = Position.new(up_left.x + size, up_left.y + size)
    self.rect_in_window(attributes)
  end
end
