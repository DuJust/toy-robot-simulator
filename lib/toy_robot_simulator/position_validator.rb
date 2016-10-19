require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  class PositionValidator
    MIN_POSITION = 0
    MAX_POSITION = 5

    attr_reader :errors

    def initialize(position)
      @position = position
    end

    def valid?
      @errors = []
      validate_x
      validate_y
      validate_orientation
      @errors.empty?
    end

    def errors
      @errors ||= []
    end

    private

    def validate_x
      unless @position.x
        @errors << 'Position X is empty.'
      else
        @errors << "Position X:#{@position.x} should be equal or more than 0." unless @position.x >= MIN_POSITION
        @errors << "Position X:#{@position.x} should be less than 5." unless @position.x < MAX_POSITION
      end
    end

    def validate_y
      unless @position.y
        @errors << 'Position Y is empty.'
      else
        @errors << "Position Y:#{@position.y} should be equal or more than 0." unless @position.y >= MIN_POSITION
        @errors << "Position Y:#{@position.y} should be less than 5." unless @position.y < MAX_POSITION
      end
    end

    def validate_orientation
      unless @position.orientation
        @errors << 'Position orientation is empty.'
      else
        unless Position::ORIENTATIONS.include?(@position.orientation)
          @errors << "Position orientation #{@position.orientation} is should be one of #{Position::ORIENTATIONS.join(',')}."
        end
      end
    end
  end
end
