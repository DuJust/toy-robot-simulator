require 'toy_robot_simulator/position'

module ToyRobotSimulator
  class Position::Validator
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
      validate_coordinate('X', @position.x)
    end

    def validate_y
      validate_coordinate('Y', @position.y)
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

    def validate_coordinate(key, value)
      unless value
        @errors << "Position #{key} is empty."
      else
        @errors << "Position #{key}:#{value} should be equal or more than 0." unless value >= MIN_POSITION
        @errors << "Position #{key}:#{value} should be less than 5." unless value < MAX_POSITION
      end
    end
  end
end
