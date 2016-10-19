require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  class Command
    def initialize(robot = Robot.new)
      @robot = robot
    end

    def run(command_string)
      command = command_string.split
      case command.first
        when 'PLACE'
          x, y, orientation = command.last.split(',')
          @robot.place(x.to_i, y.to_i, orientation) if valid_integer?(x) && valid_integer?(y)
        when 'MOVE'
          @robot.move
        when 'LEFT'
          @robot.left
        when 'RIGHT'
          @robot.right
        when 'REPORT'
          @robot.report
      end
    end

    private

    def valid_integer?(integer_string)
      Integer(integer_string)
    rescue ArgumentError
      false
    else
      true
    end
  end
end
