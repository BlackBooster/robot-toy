class Left
  def initialize(robot)
    @robot = robot
  end

  # robot will move to left
  def execute
    if @robot.placed?
      @robot.current_position = Position.new(@robot.current_position.x,
                                             @robot.current_position.y,
                                             @robot.current_position.direction_left)
    end
  end
end
