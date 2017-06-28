require 'spec_helper'
require 'commands/left'
require 'commands/move'
require 'commands/place'
require 'commands/right'
require 'commands/report'
require 'commands/position'
require 'robot'
require 'table'

describe Robot do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 7) }

  describe '#place' do
    before do
      Place.new(robot, table, position).execute
    end

    context 'with valid position' do
      let(:position) { Position.new(2, 3, 'NORTH') }

      it 'places robot in the correct position' do
        expect(robot.current_position).to eq(position)
      end
    end

    context 'with invalid position' do
      let(:position) { Position.new(9, 9, 'NORTH') }

      it 'will not place robot' do
        expect(robot.current_position).to be nil
      end
    end
  end

  describe '#report' do
    let(:position) { Position.new(2, 3, 'NORTH') }

    context 'after inicial placement of the robot' do
      it 'reports current position correctly' do
        Place.new(robot, table, position).execute

        expect(robot.report).to eq('2,3,NORTH')
      end
    end

    context 'before initial placement of the robot' do
      it 'reports error message' do
        expect(robot.report).to eq('not in place')
      end
    end
  end

  describe '#report' do
    it 'returns a short report' do
      position = Position.new(1, 1, 'NORTH')

      Place.new(robot, table, position).execute

      expect(robot.report).to eq('1,1,NORTH')
    end
  end

  describe '#execute_command' do
    context 'when placed correctly' do
      it 'correctly turns to the left' do
        position = Position.new(1, 1, 'NORTH')

        Place.new(robot, table, position).execute

        Left.new(robot).execute

        expect(robot.report).to eq('1,1,WEST')
      end

      it 'correctly turns to the right' do
        position = Position.new(1, 1, 'NORTH')

        Place.new(robot, table, position).execute

        Right.new(robot).execute

        expect(robot.report).to eq('1,1,EAST')
      end

      it 'correctly moves NORTH' do
        position = Position.new(1, 1, 'NORTH')

        Place.new(robot, table, position).execute

        Move.new(robot, table).execute

        expect(robot.report).to eq('1,2,NORTH')
      end

      it 'correctly moves SOUTH' do
        position = Position.new(1, 1, 'SOUTH')

        Place.new(robot, table, position).execute

        Move.new(robot, table).execute

        expect(robot.report).to eq('1,0,SOUTH')
      end

      it 'correctly moves EAST' do
        position = Position.new(1, 1, 'EAST')

        Place.new(robot, table, position).execute

        Move.new(robot, table).execute

        expect(robot.report).to eq('2,1,EAST')
      end

      it 'correctly moves WEST' do
        position = Position.new(1, 1, 'WEST')

        Place.new(robot, table, position).execute

        Move.new(robot, table).execute

        expect(robot.report).to eq('0,1,WEST')
      end
    end

    context 'before being placed in a table' do
      it 'ignores other commands' do
        Move.new(robot, table).execute
        Left.new(robot).execute
        Right.new(robot).execute

        expect(robot.report).to eq('not in place')
      end
    end
  end

  describe '#placed?' do
    context 'before robot is placed' do
      it 'returns false' do
        expect(robot.placed?).to be false
      end
    end

    context 'after robot is placed' do
      it 'returns true' do
        Place.new(robot, table, Position.new(1, 2, 'EAST')).execute

        expect(robot.placed?).to be true
      end
    end
  end
end