require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  class Position
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
      @validator = PositionValidator.new(self)
      @validator.valid?
    end

    def errors
      on_table? unless instance_variable_defined? :@validator
      @validator.errors
    end

    def clone_with(**args)
      cloned = self.clone
      args.each do |k, v|
        instance_variable_name = "@#{k}"
        if cloned.instance_variable_defined? instance_variable_name
          cloned.instance_variable_set(instance_variable_name, v)
        end
      end
      cloned
    end

    ORIENTATIONS.each do |orientation|
      define_method "#{orientation.downcase}?" do
        @orientation == orientation
      end

      define_method "turn_#{orientation.downcase}" do
        @orientation = orientation
      end
    end
  end
end
