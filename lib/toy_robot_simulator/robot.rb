module ToyRobotSimulator
  class Robot
    NORTH = 'NORTH'
    WEST  = 'WEST'
    EAST  = 'EAST'
    SOUTH = 'SOUTH'

    def place(x, y, orientation)
      @x           = x
      @y           = y
      @orientation = orientation
    end

    def report
      [@x, @y, @orientation].join(',') if on_table?
    end

    def move
      return unless on_table?

      @y += 1 if @orientation == NORTH
      @y -= 1 if @orientation == SOUTH
      @x += 1 if @orientation == EAST
      @x -= 1 if @orientation == WEST
    end

    def left
      return unless on_table?

      @orientation = case @orientation
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

      @orientation = case @orientation
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

    def on_table?
      @x && @y && @orientation
    end
  end
end
