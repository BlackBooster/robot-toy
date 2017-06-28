require 'spec_helper'
require 'initialize_commander'
require 'commands/left'
require 'commands/move'
require 'commands/place'
require 'commands/right'
require 'commands/report'
require 'commands/position'
require 'robot'
require 'table'

describe InitializeCommander do
  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }
  let(:initialize_commander) { InitializeCommander.new(robot, table) }

  describe '#read_command' do
    context 'PLACE command' do
      input = 'PLACE 1, 1, NORTH'

      it 'creates a valid command' do
        position = instance_double('Position', x: 1, y: 1, direction: 'NORTH')

        expect(Position).to receive(:new).with(1, 1, 'NORTH').and_return(position)

        expect(Place).to receive(:new).with(robot, table, position)

        initialize_commander.read_command(input)
      end

      it 'returns command' do
        expect(initialize_commander.read_command(input)).to be_a Place
      end
    end

    context 'MOVE command' do
      input = 'MOVE'

      it 'creates a valid command' do
        expect(Move).to receive(:new).with(robot, table)

        initialize_commander.read_command(input)
      end

      it 'returns command' do
        expect(initialize_commander.read_command(input)).to be_a Move
      end
    end

    context 'LEFT command' do
      input = 'LEFT'

      it 'creates a valid command' do
        expect(Left).to receive(:new).with(robot)

        initialize_commander.read_command(input)
      end

      it 'returns command' do
        expect(initialize_commander.read_command(input)).to be_a Left
      end
    end

    context 'RIGHT command' do
      input = 'RIGHT'

      it 'creates a valid command' do
        expect(Right).to receive(:new).with(robot)

        initialize_commander.read_command(input)
      end

      it 'returns command' do
        expect(initialize_commander.read_command(input)).to be_a Right
      end
    end

    context 'REPORT command' do
      input = 'REPORT'

      it 'creates a valid command' do
        expect(Report).to receive(:new).with(robot)

        initialize_commander.read_command(input)
      end

      it 'returns command' do
        expect(initialize_commander.read_command(input)).to be_a Report
      end
    end

    context 'INVALID command' do
      it 'returns nil' do
        input = 'HELLO 0,0,NORTH'

        expect(initialize_commander.read_command(input)).to be nil
      end
    end
  end
end
