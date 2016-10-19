require 'spec_helper'
require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  describe Robot do
    let(:robot) { Robot.new }

    describe '#place and #report' do
      it 'should place robot to specific position' do
        robot.place(0, 0, 'NORTH')

        expect(robot.report).to eq('0,0,NORTH')
      end
    end

    describe '#move' do
      it 'should move forward north' do
        robot.place(0, 0, 'NORTH')
        robot.move

        expect(robot.report).to eq('0,1,NORTH')
      end
    end
  end
end