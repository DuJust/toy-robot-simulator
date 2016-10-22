require 'spec_helper'
require 'toy_robot_simulator/command'

RSpec.shared_examples "log robot errors" do |method, command_string|
  before do
    allow(robot).to receive(:errors).and_return ["there's an error"]
    allow(robot).to receive(method).and_return false
  end

  it "uses the given parameter" do
    expect { command.run(command_string) }.to output(/Line '#{command_string}' ignore because: there's an error/)
                                                .to_stdout
  end
end

module ToyRobotSimulator
  describe Command do
    let(:command) { Command.new(robot) }
    let(:robot) { double(:robot, place: true, errors: []) }

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

        it_should_behave_like "log robot errors", :place, 'PLACE 0,0,NORTH'
      end

      describe 'MOVE command' do
        it 'should move robot' do
          expect(robot).to receive(:move)
          command.run('MOVE')
        end

        it_should_behave_like "log robot errors", :move, 'MOVE'
      end

      describe 'LEFT command' do
        it 'should turn robot left' do
          expect(robot).to receive(:left)
          command.run('LEFT')
        end

        it_should_behave_like "log robot errors", :left, 'LEFT'
      end

      describe 'RIGHT command' do
        it 'should turn robot right' do
          expect(robot).to receive(:right)
          command.run('RIGHT')
        end

        it_should_behave_like "log robot errors", :right, 'RIGHT'
      end

      describe 'REPORT command' do
        it 'should print robot report' do
          expect(robot).to receive(:report)
          command.run('REPORT')
        end

        it_should_behave_like "log robot errors", :report, 'REPORT'
      end
    end
  end
end
