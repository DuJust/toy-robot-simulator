module ToyRobotSimulator
  class Command
    def initialize(robot = Robot.new)
      @robot = robot
    end

    def run(line)
      log_errors(line) unless operate_robot(line)
    end

    private

    def operate_robot(line)
      command = line.split
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

    def log_errors(line)
      @robot.errors.each { |error| puts "Line \'#{line}\' ignore because: #{error}" }
    end

    def valid_integer?(integer_string)
      Integer(integer_string)
    rescue ArgumentError
      false
    else
      true
    end
  end
end
