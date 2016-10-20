require 'spec_helper'
require 'toy_robot_simulator/position'

module ToyRobotSimulator
  describe Position do
    let(:position) { Position.new(x, y, orientation) }
    let(:x) { 0 }
    let(:y) { 0 }
    let(:orientation) { Position::NORTH }

    describe '#on_table?' do
      subject { position.on_table? }

      context 'when validator pass' do
        before { allow_any_instance_of(Position::Validator).to receive(:valid?).and_return true }
        it { is_expected.to be_truthy }
      end

      context 'when validator failed' do
        before { allow_any_instance_of(Position::Validator).to receive(:valid?).and_return false }
        it { is_expected.to be_falsey }
      end
    end

    describe '#errors' do
      context 'when position has not been validated' do
        it 'should validate first' do
          expect(position.errors).to eq([])
        end
      end

      context 'when position has been validated' do
        before { position.on_table? }

        it 'should return validated result' do
          expect(position.errors).to eq([])
        end
      end
    end

    describe '#north?' do
      let(:orientation) { Position::NORTH }

      subject { position.north? }

      it { is_expected.to eq(true) }
    end

    describe '#west?' do
      let(:orientation) { Position::WEST }

      subject { position.west? }

      it { is_expected.to eq(true) }
    end

    describe '#east?' do
      let(:orientation) { Position::EAST }

      subject { position.east? }

      it { is_expected.to eq(true) }
    end

    describe '#south?' do
      let(:orientation) { Position::SOUTH }

      subject { position.south? }

      it { is_expected.to eq(true) }
    end
  end
end
