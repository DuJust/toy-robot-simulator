require 'spec_helper'
require 'toy_robot_simulator'

describe ToyRobotSimulator do
  describe '#place' do
    let(:toy_robot_simulator) { ToyRobotSimulator.new(robot) }
    let(:robot) { Robot.new }
    subject { toy_robot_simulator.place(0, 0, 'NORTH') }
    
    it 'should place robot to specific position' do
      subject
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
      expect(robot.orientation).to eq('NORTH')
    end
  end
end