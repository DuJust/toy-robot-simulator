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
          @robot.place(x.to_i, y.to_i, orientation)
        when 'MOVE'
          @robot.move
        when 'LEFT'
          @robot.left
        when 'RIGHT'
          @robot.right
        when 'REPORT'
          puts @robot.report
      end
    end
  end
end
