module ToyRobotSimulator
  class Robot
    NORTH = 'NORTH'

    def place(x, y, orientation)
      @x           = x
      @y           = y
      @orientation = orientation
    end

    def report
      [@x, @y, @orientation].join(',')
    end

    def move
      if @orientation == NORTH
        @y += 1
      end
    end
  end
end
