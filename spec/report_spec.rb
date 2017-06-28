require 'spec_helper'
require 'commands/place'
require 'commands/report'
require 'commands/position'
require 'robot'
require 'table'

describe Report do
  describe '#execute' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }

    context 'with valid position' do
      let!(:position) { Position.new(1, 1, 'NORTH') }

      it 'prints report to stdout' do
        report = Report.new(robot)

        Place.new(robot, table, position).execute

        expected_report = "1,1,NORTH\n"

        expect { Report.new(robot).execute }.to output(expected_report).to_stdout
      end
    end

    context 'with invalid position' do
      let!(:position) { Position.new(-1, 1, 'NORTH') }

      it 'prints report to stdout' do
        report = Report.new(robot)

        Place.new(robot, table, position).execute

        expected_report = "not in place\n"

        expect { Report.new(robot).execute }.to output(expected_report).to_stdout
      end
    end
  end
end
