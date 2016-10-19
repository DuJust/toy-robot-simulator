require 'rspec/core'
require 'rspec/its'

require_relative '../toy_robot_simulator'

RSpec.configure do |config|
  config.color     = true
  config.tty       = true
  config.formatter = :documentation
end