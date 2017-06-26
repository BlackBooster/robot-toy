class Table
  def initialize(length, width)
    @length = length
    @width  = width
  end

  # method will check if coordinates are not negative or more then table given surface
  def position_is_valid?(position)
    position.x < @length &&
      position.y < @width &&
      position.x >= 0 &&
      position.y >= 0
  end
end
