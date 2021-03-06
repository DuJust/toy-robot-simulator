require 'spec_helper'
require 'toy_robot_simulator/position/validator'

module ToyRobotSimulator
  describe Position::Validator do
    let(:validator) { Position::Validator.new(position) }
    let(:position) { Position.new(x, y, orientation) }
    let(:x) { 0 }
    let(:y) { 0 }
    let(:orientation) { Position::NORTH }

    describe '#on_table?' do
      subject { validator.valid? }

      it { is_expected.to be_truthy }

      context 'position x' do
        context 'when nil' do
          let(:x) { nil }

          it { is_expected.to be_falsey }
          it 'should have position x empty error' do
            subject
            expect(validator.errors).to include('Position X is empty.')
          end
        end

        context 'when less than 0' do
          let(:x) { -1 }

          it { is_expected.to be_falsey }
          it 'should have position x less than error' do
            subject
            expect(validator.errors).to include('Position X:-1 should be equal or more than 0.')
          end
        end

        context 'when more than 5' do
          let(:x) { 5 }

          it { is_expected.to be_falsey }
          it 'should have position x more than error' do
            subject
            expect(validator.errors).to include('Position X:5 should be less than 5.')
          end
        end
      end

      context 'position y' do
        context 'when nil' do
          let(:y) { nil }

          it { is_expected.to be_falsey }
          it 'should have position y empty error' do
            subject
            expect(validator.errors).to include('Position Y is empty.')
          end
        end

        context 'when less than 0' do
          let(:y) { -1 }

          it { is_expected.to be_falsey }
          it 'should have position y less than error' do
            subject
            expect(validator.errors).to include('Position Y:-1 should be equal or more than 0.')
          end
        end

        context 'when more than 5' do
          let(:y) { 5 }

          it { is_expected.to be_falsey }
          it 'should have position y more than error' do
            subject
            expect(validator.errors).to include('Position Y:5 should be less than 5.')
          end
        end
      end

      context 'orientation' do
        context 'when nil' do
          let(:orientation) { nil }

          it { is_expected.to be_falsey }
          it 'should have position orientation empty error' do
            subject
            expect(validator.errors).to include('Position orientation is empty.')
          end
        end

        context 'when not orientation' do
          let(:orientation) { 'WHATEVER' }

          it { is_expected.to be_falsey }
          it 'should have position orientation invalid error' do
            subject
            expect(validator.errors).to include("Position orientation WHATEVER is should be one of NORTH,EAST,SOUTH,WEST.")
          end
        end
      end
    end
  end
end
