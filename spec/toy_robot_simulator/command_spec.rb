require 'spec_helper'
require 'toy_robot_simulator/command'

module ToyRobotSimulator
  describe Command do
    describe 'PLACE command' do
      let(:command) { Command.new(robot) }
      let(:robot) { double(:robot) }
      let(:command_string) { 'PLACE 0,0,NORTH' }

      it 'should place robot' do
        expect(robot).to receive(:place).with(0, 0, 'NORTH')
        command.run(command_string)
      end
    end
  end
end
