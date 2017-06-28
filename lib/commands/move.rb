class Move
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # robot will move one step forward, otherwise nothing will happen if command is invalid
  def execute
    if @robot.placed?
      new_position = @robot.current_position.go_to(@robot.current_position.direction)

      @robot.current_position = new_position if @table.position_is_valid?(new_position)
    end
  end
end
