require 'rspec/core'
require 'rspec/its'

require_relative '../lib/toy_robot_simulator'

RSpec.configure do |config|
  config.color     = true
  config.tty       = true
  config.formatter = :documentation
end

# Redirect stderr and stdout
RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
  config.before(:all) do
    $stderr = File.open(File::NULL, "w")
    $stdout = File.open(File::NULL, "w")
  end
  config.after(:all) do
    $stderr = original_stderr
    $stdout = original_stdout
  end
end
