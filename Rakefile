require_relative 'lib/toy_robot_simulator'

desc 'Run toy robot simulator'
task :simulate, [:file_path] do |_, args|
  if args[:file_path] && File.exist?(args[:file_path])
    ToyRobotSimulator::Command.new.read_from_io(File.new(args[:file_path]))
  else
    puts "There's not such file, please check you file path."
  end
end
