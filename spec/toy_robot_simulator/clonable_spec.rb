require 'spec_helper'
require 'toy_robot_simulator/clonable'

module ToyRobotSimulator
  describe Clonable do
    let(:dummy_class) do
      Class.new do
        include Clonable
        attr_accessor :foo
      end
    end

    let(:object) { dummy_class.new.tap { |o| o.foo = 0 } }

    it 'should assign specific value' do
      cloned_position = object.clone_with(foo: 1)
      expect(cloned_position.foo).to eq(1)
    end

    it 'should not effect the origin position' do
      object.clone_with(foo: 5)
      expect(object.foo).to eq(0)
    end

    it 'should ignore invalid instance variable' do
      cloned_position = object.clone_with(whaterver: 5)
      expect(cloned_position.foo).to eq(0)
    end
  end
end
