require 'spec_helper'
require 'toy_robot_simulator/command'

module ToyRobotSimulator
  describe Command do
    let(:command) { Command.new(robot) }
    let(:robot) { double(:robot) }

    describe '#read_from_io' do
      let(:io) { File.open('spec/fixtures/test1') }

      it 'should read io and run each command' do
        expect(robot).to receive(:place)
        expect(robot).to receive(:report)
        command.read_from_io(io)
      end

      it 'should rescue any error and run following command' do
        expect(robot).to receive(:place).and_raise Exception
        expect(robot).to receive(:report)
        command.read_from_io(io)
      end
    end

    describe '#run' do
      describe 'PLACE command' do
        it 'should place robot' do
          expect(robot).to receive(:place).with(0, 0, 'NORTH')
          command.run('PLACE 0,0,NORTH')
        end

        it 'should ignore invalid x position command' do
          expect(robot).not_to receive(:place)
          command.run('PLACE a,0,NORTH')
        end

        it 'should ignore invalid y position command' do
          expect(robot).not_to receive(:place)
          command.run('PLACE 0,a,NORTH')
        end
      end

      describe 'MOVE command' do
        it 'should move robot' do
          expect(robot).to receive(:move)
          command.run('MOVE')
        end
      end

      describe 'LEFT command' do
        it 'should turn robot left' do
          expect(robot).to receive(:left)
          command.run('LEFT')
        end
      end

      describe 'RIGHT command' do
        it 'should turn robot right' do
          expect(robot).to receive(:right)
          command.run('RIGHT')
        end
      end

      describe 'REPORT command' do
        it 'should print robot report' do
          expect(robot).to receive(:report).and_return('robot report')
          command.run('REPORT')
        end
      end
    end
  end
end
