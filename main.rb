require_relative 'lib/initialize'
require_relative 'lib/table_surface'
require_relative 'lib/robot'
require_relative 'lib/place_position'
require_relative 'lib/move'
require_relative 'lib/left'
require_relative 'lib/position'
require_relative 'lib/right'
require_relative 'lib/report'

# initializes table, robot and commands that will be executed
table = Table.new(5, 5)
robot = Robot.new
init_commands = Initialize.new(robot, table)

puts "Cheers, love! The Cavalry's here!"

loop do
  puts "Type your command (type exit to close): "

  input = gets

  command = init_commands.read_command(input)

  command.execute unless command.nil?

  break if input =~ /exit/i
end