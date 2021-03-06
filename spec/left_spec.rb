require 'spec_helper'
require 'commands/left'
require 'commands/place'
require 'commands/position'
require 'robot'
require 'table'

describe Left do
  describe '#execute' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:left) { Left.new(robot) }

    it 'when facing NORTH turns WEST' do
      position = Position.new(1, 1, 'NORTH')

      Place.new(robot, table, position).execute

      left.execute

      expect(robot.report).to eq('1,1,WEST')
    end

    it 'when facing WEST turns SOUTH' do
      position = Position.new(1, 1, 'WEST')

      Place.new(robot, table, position).execute

      left.execute

      expect(robot.report).to eq('1,1,SOUTH')
    end

    it 'when facing SOUTH turns EAST' do
      position = Position.new(1, 1, 'SOUTH')

      Place.new(robot, table, position).execute

      left.execute

      expect(robot.report).to eq('1,1,EAST')
    end

    it 'when facing EAST turns NORTH' do
      position = Position.new(1, 1, 'EAST')

      Place.new(robot, table, position).execute

      left.execute

      expect(robot.report).to eq('1,1,NORTH')
    end
  end
end
