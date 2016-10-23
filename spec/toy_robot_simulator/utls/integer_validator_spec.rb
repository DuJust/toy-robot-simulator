require 'spec_helper'
require 'toy_robot_simulator/utils/integer_validator'

module ToyRobotSimulator::Utils
  describe IntegerValidator do
    let(:dummy_class) do
      Class.new do
        include IntegerValidator
      end
    end

    let(:object) { dummy_class.new }

    it 'should be true when is integer string' do
      expect(object.valid_integer?('1')).to eq(true)
    end

    it 'should false when is letter' do
      expect(object.valid_integer?('a')).to eq(false)
    end

    it 'should false when contain letter' do
      expect(object.valid_integer?('1a')).to eq(false)
    end
  end
end
