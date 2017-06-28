class Place
  def initialize(robot, table, position)
    @robot = robot
    @table = table
    @position = position
  end

  # places robot at given position coordinates, otherwise nothing will happen
  def execute
    @robot.current_position = @position if @table.position_is_valid?(@position)
  end
end
