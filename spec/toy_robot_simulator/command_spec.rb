require 'spec_helper'
require 'toy_robot_simulator/command'

module ToyRobotSimulator
  describe Command do
    let(:command) { Command.new(robot) }
    let(:robot) { double(:robot) }

    describe 'PLACE command' do
      let(:command_string) { 'PLACE 0,0,NORTH' }

      it 'should place robot' do
        expect(robot).to receive(:place).with(0, 0, 'NORTH')
        command.run(command_string)
      end
    end

    describe 'MOVE command' do
      let(:command_string) { 'MOVE' }

      it 'should move robot' do
        expect(robot).to receive(:move)
        command.run(command_string)
      end
    end

    describe 'LEFT command' do
      let(:command_string) { 'LEFT' }

      it 'should turn robot left' do
        expect(robot).to receive(:left)
        command.run(command_string)
      end
    end

    describe 'RIGHT command' do
      let(:command_string) { 'RIGHT' }

      it 'should turn robot right' do
        expect(robot).to receive(:right)
        command.run(command_string)
      end
    end

    describe 'REPORT command' do
      let(:command_string) { 'REPORT' }

      it 'should print robot report' do
        expect(robot).to receive(:report).and_return('robot report')
        command.run(command_string)
      end
    end
  end
end
