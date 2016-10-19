require 'spec_helper'
require 'toy_robot_simulator/file_reader'

module ToyRobotSimulator
  describe FileReader do
    describe '#each_line', redirect_output: true do
      let(:io) { File.new('spec/fixtures/test1') }

      it 'should yield each line' do
        expect { |block| FileReader.each_line(io, &block) }.to yield_control.exactly(2).times
      end
    end
  end
end
