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

      it { is_expected.to be_truthy }

      context 'position x' do
        context 'when nil' do
          let(:x) { nil }

          it { is_expected.to be_falsey }
          it 'should have position x empty error' do
            subject
            expect(position.errors).to include('Position X is empty.')
          end
        end

        context 'when less than 0' do
          let(:x) { -1 }

          it { is_expected.to be_falsey }
          it 'should have position x less than error' do
            subject
            expect(position.errors).to include('Position X -1 is less than 0.')
          end
        end

        context 'when more than 5' do
          let(:x) { 6 }

          it { is_expected.to be_falsey }
          it 'should have position x more than error' do
            subject
            expect(position.errors).to include('Position X 6 is more than 0.')
          end
        end
      end

      context 'position y' do
        context 'when nil' do
          let(:y) { nil }

          it { is_expected.to be_falsey }
          it 'should have position y empty error' do
            subject
            expect(position.errors).to include('Position Y is empty.')
          end
        end

        context 'when less than 0' do
          let(:y) { -1 }

          it { is_expected.to be_falsey }
          it 'should have position y less than error' do
            subject
            expect(position.errors).to include('Position Y -1 is less than 0.')
          end
        end

        context 'when more than 5' do
          let(:y) { 6 }

          it { is_expected.to be_falsey }
          it 'should have position y more than error' do
            subject
            expect(position.errors).to include('Position Y 6 is more than 0.')
          end
        end
      end

      context 'orientation' do
        context 'when nil' do
          let(:orientation) { nil }

          it { is_expected.to be_falsey }
          it 'should have position orientation empty error' do
            subject
            expect(position.errors).to include('Position orientation is empty.')
          end
        end

        context 'when not orientation' do
          let(:orientation) { 'WHATEVER' }

          it { is_expected.to be_falsey }
          it 'should have position orientation invalid error' do
            subject
            expect(position.errors).to include("Position orientation WHATEVER is should be one of NORTH,EAST,SOUTH,WEST.")
          end
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

    describe '#turn_north' do
      subject do
        position.turn_north
        position.north?
      end

      it { is_expected.to eq(true) }
    end

    describe '#turn_east' do
      subject do
        position.turn_east
        position.east?
      end

      it { is_expected.to eq(true) }
    end

    describe '#turn_south' do
      subject do
        position.turn_south
        position.south?
      end

      it { is_expected.to eq(true) }
    end

    describe '#turn_west' do
      subject do
        position.turn_west
        position.west?
      end

      it { is_expected.to eq(true) }
    end
  end
end
