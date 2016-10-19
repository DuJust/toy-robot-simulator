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

    def initialize(x, y, orientation)
      @x           = x
      @y           = y
      @orientation = orientation
    end

    def on_table?
      x && y && orientation &&
        x >= MIN_POSITION && x <= MAX_POSITION &&
        y >= MIN_POSITION && y <= MAX_POSITION &&
        ORIENTATIONS.include?(orientation)
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