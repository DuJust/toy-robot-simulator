require 'toy_robot_simulator/position'

module ToyRobotSimulator
  class Robot
    def place(x, y, orientation)
      position  = Position.new(x, y, orientation)
      @position = position if on_table?(position)
    end

    def report
      [@position.x, @position.y, @position.orientation].join(',') if on_table?
    end

    def move
      return unless on_table?

      next_position = case
                        when @position.north?
                          @position.clone_with(y: @position.y + 1)
                        when @position.east?
                          @position.clone_with(x: @position.x + 1)
                        when @position.south?
                          @position.clone_with(y: @position.y - 1)
                        when @position.west?
                          @position.clone_with(x: @position.x - 1)
                      end
      @position     = next_position if next_position.on_table?
    end

    def left
      return unless on_table?

      case
        when @position.north?
          @position.turn_west
        when @position.east?
          @position.turn_north
        when @position.south?
          @position.turn_east
        when @position.west?
          @position.turn_south
      end
    end

    def right
      return unless on_table?

      case
        when @position.north?
          @position.turn_east
        when @position.east?
          @position.turn_south
        when @position.south?
          @position.turn_west
        when @position.west?
          @position.turn_north
      end
    end

    private

    def on_table?(position = @position)
      position && position.on_table?
    end
  end
end
