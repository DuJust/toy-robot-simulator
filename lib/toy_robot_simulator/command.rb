require 'toy_robot_simulator/utils/integer_validator'

module ToyRobotSimulator
  class Command
    include ToyRobotSimulator::Utils::IntegerValidator

    PLACE    = 'PLACE'
    MOVE     = 'MOVE'
    LEFT     = 'LEFT'
    RIGHT    = 'RIGHT'
    REPORT   = 'REPORT'
    COMMANDS = [PLACE, MOVE, LEFT, RIGHT, REPORT]

    def initialize(robot = Robot.new)
      @robot = robot
    end

    def run(line)
      operate_robot(line) do |command, args|
        case command
          when PLACE
            x, y, orientation = args
            @robot.place(x.to_i, y.to_i, orientation) if valid_integer?(x) && valid_integer?(y)
          when MOVE
            @robot.move
          when LEFT
            @robot.left
          when RIGHT
            @robot.right
          when REPORT
            @robot.report
        end
      end
    end

    private

    def operate_robot(line)
      words = line.split

      if COMMANDS.include?(words.first) && block_given?
        log_errors(line) unless yield words.first, words.last.split(',')
      end
    end

    def log_errors(line)
      @robot.errors.each { |error| puts "Line \'#{line}\' ignore because: #{error}" }
    end
  end
end
