require 'toy_robot_simulator/utils/clonable'

module ToyRobotSimulator
  class Position
    include ToyRobotSimulator::Utils::Clonable

    NORTH = 'NORTH'
    WEST  = 'WEST'
    EAST  = 'EAST'
    SOUTH = 'SOUTH'

    ORIENTATIONS = [NORTH, EAST, SOUTH, WEST]

    attr_accessor :x, :y, :orientation

    def initialize(x, y, orientation)
      @x           = x
      @y           = y
      @orientation = orientation
    end

    def on_table?
      @validator = Position::Validator.new(self)
      @validator.valid?
    end

    def errors
      on_table? unless instance_variable_defined? :@validator
      @validator.errors
    end

    ORIENTATIONS.each do |orientation|
      define_method "#{orientation.downcase}?" do
        @orientation == orientation
      end
    end
  end
end
