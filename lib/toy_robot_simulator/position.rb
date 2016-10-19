require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  class Position
    NORTH = 'NORTH'
    WEST  = 'WEST'
    EAST  = 'EAST'
    SOUTH = 'SOUTH'

    ORIENTATIONS = [NORTH, EAST, SOUTH, WEST]

    MIN_POSITION = 0
    MAX_POSITION = 5

    attr_accessor :x, :y, :orientation
    attr_reader :errors

    def initialize(x, y, orientation)
      @x           = x
      @y           = y
      @orientation = orientation
    end

    def on_table?
      @errors = []
      validate_x
      validate_y
      validate_orientation
      @errors.empty?
    end

    ORIENTATIONS.each do |orientation|
      define_method "#{orientation.downcase}?" do
        @orientation == orientation
      end

      define_method "turn_#{orientation.downcase}" do
        @orientation = orientation
      end
    end

    private

    def validate_x
      unless x
        @errors << 'Position X is empty.'
      else
        @errors << "Position X #{x} is less than 0." unless x >= MIN_POSITION
        @errors << "Position X #{x} is more than 0." unless x <= MAX_POSITION
      end
    end

    def validate_y
      unless y
        @errors << 'Position Y is empty.'
      else
        @errors << "Position Y #{y} is less than 0." unless y >= MIN_POSITION
        @errors << "Position Y #{y} is more than 0." unless y <= MAX_POSITION
      end
    end

    def validate_orientation
      unless orientation
        @errors << 'Position orientation is empty.'
      else
        unless ORIENTATIONS.include?(orientation)
          @errors << "Position orientation #{orientation} is should be one of #{ORIENTATIONS.join(',')}."
        end
      end
    end
  end
end
