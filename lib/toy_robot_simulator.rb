require_relative 'toy_robot_simulator/robot'

class ToyRobotSimulator
  def initialize(robot)
    @robot = robot
  end

  def place(x, y, orientation)
    @robot.x           = x
    @robot.y           = y
    @robot.orientation = orientation
  end
end