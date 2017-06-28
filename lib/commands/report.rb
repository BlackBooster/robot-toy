class Report

  def initialize(robot)
    @robot = robot
  end

  # creating readable format to robot current position
  def execute
    puts @robot.report
  end
end