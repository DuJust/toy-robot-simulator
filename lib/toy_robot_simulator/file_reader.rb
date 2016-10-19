module ToyRobotSimulator
  class FileReader
    def self.each_line(io)
      until io.eof?
        begin
          yield io.readline.strip if block_given?
        rescue Exception => e
          puts e.message
          puts e.backtrace.inspect
        end
      end
    end
  end
end
