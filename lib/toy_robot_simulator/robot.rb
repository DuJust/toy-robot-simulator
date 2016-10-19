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
      [@x, @y, @orientation].join(',')
    end

    def move
      @y += 1 if @orientation == NORTH
      @y -= 1 if @orientation == SOUTH
      @x += 1 if @orientation == EAST
      @x -= 1 if @orientation == WEST
    end

    def left
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
      @orientation = EAST if @orientation == NORTH
    end
  end
end
