module ToyRobotSimulator
  module Clonable
    def clone_with(**args)
      cloned = self.clone
      args.each do |k, v|
        instance_variable_name = "@#{k}"
        if cloned.instance_variable_defined? instance_variable_name
          cloned.instance_variable_set(instance_variable_name, v)
        end
      end
      cloned
    end
  end
end
