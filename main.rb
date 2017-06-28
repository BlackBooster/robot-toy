require_relative 'lib/initialize_commander'
require_relative 'lib/table'
require_relative 'lib/robot'
require_relative 'lib/commands/place'
require_relative 'lib/commands/move'
require_relative 'lib/commands/left'
require_relative 'lib/commands/position'
require_relative 'lib/commands/right'
require_relative 'lib/commands/report'

# initializes table, robot and commands that will be executed
table = Table.new(5, 5)
robot = Robot.new
init_commands = InitializeCommander.new(robot, table)

puts "Cheers love! The Cavalry's here!"

loop do
  puts "Type your command (type exit to close): "

  input = gets

  command = init_commands.read_command(input)

  command.execute unless command.nil?

  break if input =~ /exit/i
end