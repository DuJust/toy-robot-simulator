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

      next_position = case @position.orientation
                        when NORTH
                          Position.new(@position.x, @position.y + 1, @position.orientation)
                        when SOUTH
                          Position.new(@position.x, @position.y - 1, @position.orientation)
                        when EAST
                          Position.new(@position.x + 1, @position.y, @position.orientation)
                        when WEST
                          Position.new(@position.x - 1, @position.y, @position.orientation)
                      end
      @position     = next_position if next_position.on_table?
    end

    def left
      return unless on_table?

      @position.orientation = case @position.orientation
                                when NORTH
                                  WEST
                                when WEST
                                  SOUTH
                                when SOUTH
                                  EAST
                                when EAST
                                  NORTH
                              end
    end

    def right
      return unless on_table?

      @position.orientation = case @position.orientation
                                when NORTH
                                  EAST
                                when EAST
                                  SOUTH
                                when SOUTH
                                  WEST
                                when WEST
                                  NORTH
                              end
    end

    private

    def on_table?(position = @position)
      position && position.on_table?
    end
  end
end
