require 'spec_helper'
require 'toy_robot_simulator/position'

module ToyRobotSimulator
  describe Position do
    describe '#on_table?' do
      let(:x) { 0 }
      let(:y) { 0 }
      let(:orientation) { ToyRobotSimulator::Robot::NORTH }

      subject { Position.new(x, y, orientation).on_table? }

      it { is_expected.to be_truthy }

      context 'position x' do
        context 'when nil' do
          let(:x) { nil }

          it { is_expected.to be_falsey }
        end

        context 'when less than 0' do
          let(:x) { -1 }

          it { is_expected.to be_falsey }
        end

        context 'when more than 5' do
          let(:x) { 6 }

          it { is_expected.to be_falsey }
        end
      end

      context 'position y' do
        context 'when nil' do
          let(:y) { nil }

          it { is_expected.to be_falsey }
        end

        context 'when less than 0' do
          let(:y) { -1 }

          it { is_expected.to be_falsey }
        end

        context 'when more than 5' do
          let(:y) { 6 }

          it { is_expected.to be_falsey }
        end
      end

      context 'orientation' do
        let(:orientation) { 'WHATEVER' }

        it { is_expected.to be_falsey }
      end
    end
  end
end