module ToyRobotSimulator
  class Robot
    NORTH = 'NORTH'
    WEST  = 'WEST'

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
    end

    def left
      @orientation = WEST if @orientation == NORTH
    end
  end
end
