require 'spec_helper'
require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  describe Robot do
    describe '#place and #report' do
      let(:robot) { Robot.new }
      
      it 'should place robot to specific position' do
        robot.place(0, 0, 'NORTH')
        
        expect(robot.report).to eq('0,0,NORTH')
      end
    end
  end
end
