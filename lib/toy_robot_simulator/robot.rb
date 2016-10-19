require 'toy_robot_simulator/position'

module ToyRobotSimulator
  class Robot
    NORTH = 'NORTH'
    WEST  = 'WEST'
    EAST  = 'EAST'
    SOUTH = 'SOUTH'

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
                          Position.new(@position.x, @position.y + 1, @position.orientation)
                        when @position.east?
                          Position.new(@position.x + 1, @position.y, @position.orientation)
                        when @position.south?
                          Position.new(@position.x, @position.y - 1, @position.orientation)
                        when @position.west?
                          Position.new(@position.x - 1, @position.y, @position.orientation)
                      end
      @position     = next_position if next_position.on_table?
    end

    def left
      return unless on_table?

      @position.orientation = case
                                when @position.north?
                                  WEST
                                when @position.east?
                                  NORTH
                                when @position.south?
                                  EAST
                                when @position.west?
                                  SOUTH
                              end
    end

    def right
      return unless on_table?

      @position.orientation = case
                                when @position.north?
                                  EAST
                                when @position.east?
                                  SOUTH
                                when @position.south?
                                  WEST
                                when @position.west?
                                  NORTH
                              end
    end

    private

    def on_table?(position = @position)
      position && position.on_table?
    end
  end
end
