require_relative 'position'
require 'pry-byebug'

class Paint
  def self.rect_in_window(attributes = {})
    window = attributes[:window]
    top_left = attributes[:top_left]
    bottom_right = attributes[:bottom_right]
    color = attributes[:color]
    window.draw_rect(top_left.x, top_left.y, bottom_right.x - top_left.x, bottom_right.y - top_left.y, color)
  end

  def self.squre_in_window(attributes = {})
    # byebug
    top_left = attributes[:top_left]
    size = attributes[:size]
    attributes[:bottom_right] = Position.new(x: top_left.x + size, y: top_left.y + size)
    rect_in_window(attributes)
  end
end
