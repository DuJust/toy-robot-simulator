module ToyRobotSimulator
  class Robot
    def place(x, y, orientation)
      @x           = x
      @y           = y
      @orientation = orientation
    end
    
    def report
      [@x, @y, @orientation].join(',')
    end
  end
end
