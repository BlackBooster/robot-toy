class InitializeCommander
  # initializing robot as object and table
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  # reads command that user gave to robot
  def read_command(command)
    if command =~ /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      command, x, y, direction = command.tr(',', ' ').split

      Place.new(@robot, @table, Position.new(x.to_i, y.to_i, direction))
    elsif command =~ /^MOVE$/
      Move.new(@robot, @table)
    elsif command =~ /^LEFT$/
      Left.new(@robot)
    elsif command =~ /^RIGHT$/
      Right.new(@robot)
    elsif command =~ /^REPORT$/
      Report.new(@robot)
    end
  end
end
