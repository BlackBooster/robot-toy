require 'spec_helper'
require 'commands/move'
require 'commands/place'
require 'commands/position'
require 'robot'
require 'table'

describe Move do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:move) { Move.new(robot, table) }

    it 'decreases X when robot is facing WEST' do
      position = Position.new(1, 1, 'WEST')

      Place.new(robot, table, position).execute

      move.execute

      expect(robot.report).to eq('0,1,WEST')
    end

    it 'increases X when robot is facing EAST' do
      position = Position.new(1, 1, 'EAST')

      Place.new(robot, table, position).execute

      move.execute

      expect(robot.report).to eq('2,1,EAST')
    end

    it 'increases Y when robot is facing NORTH' do
      position = Position.new(1, 1, 'NORTH')

      Place.new(robot, table, position).execute

      move.execute

      expect(robot.report).to eq('1,2,NORTH')
    end

    it 'decreases Y when robot is facing SOUTH' do
      position = Position.new(1, 1, 'SOUTH')

      Place.new(robot, table, position).execute

      move.execute

      expect(robot.report).to eq('1,0,SOUTH')
    end

    it 'does nothing when position is invalid' do
      position = Position.new(4, 4, 'NORTH')

      Place.new(robot, table, position).execute

      move.execute

      expect(robot.report).to eq('4,4,NORTH')
    end
  end
end