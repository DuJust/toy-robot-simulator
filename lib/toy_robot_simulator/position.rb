require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  class Position
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
        [
          ToyRobotSimulator::Robot::NORTH,
          ToyRobotSimulator::Robot::EAST,
          ToyRobotSimulator::Robot::SOUTH,
          ToyRobotSimulator::Robot::WEST
        ].include?(orientation)
    end
  end
end