require 'toy_robot_simulator/position'

module ToyRobotSimulator
  class Robot
    attr_reader :errors

    def place(x, y, orientation)
      position = Position.new(x, y, orientation)
      on_table(position) do
        @position = position
      end
    end

    def report
      on_table do
        puts [@position.x, @position.y, @position.orientation].join(',')
      end
    end

    def move
      on_table do
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
        on_table(next_position) { @position = next_position }
      end
    end

    def left
      on_table do
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
    end

    def right
      on_table do
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
    end

    private

    def on_table(position = @position)
      @errors = []
      unless position
        @errors << 'Position is not on table.'
        return false
      end

      if position.on_table?
        yield if block_given?
        true
      else
        @errors += position.errors
        false
      end
    end
  end
end
