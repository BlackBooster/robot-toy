class Right
  def initialize(robot)
    @robot = robot
  end

  # does the same as left command but moves to right, otherwise nothing will happen
  def execute
    if @robot.placed?
      @robot.current_position = Position.new(@robot.current_position.x,
                                             @robot.current_position.y,
                                             @robot.current_position.direction_right)
    end
  end
end
