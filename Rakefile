require_relative 'lib/toy_robot_simulator'

desc 'Run toy robot simulator'
task :simulate, [:file_path] do |_, args|
  if args[:file_path] && File.exist?(args[:file_path])
    command = ToyRobotSimulator::Command.new
    ToyRobotSimulator::FileReader.each_line(File.new(args[:file_path])) do |line|
      command.run line
    end
  else
    puts "There's not such file, please check you file path."
  end
end
