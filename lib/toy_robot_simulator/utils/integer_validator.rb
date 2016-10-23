module ToyRobotSimulator
  module Utils
    module IntegerValidator
      def valid_integer?(integer_string)
        Integer(integer_string)
      rescue ArgumentError
        false
      else
        true
      end
    end
  end
end
