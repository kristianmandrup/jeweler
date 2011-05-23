class Jeweler
  module Commands
    class Executor
      attr_accessor :output

      def initialize
        self.output = $stdout
      end      

      def run
        raise "Must be implemented by subclass"
      end
      
      protected

      def print msg
        output.puts msg
      end

      def system_exec command
        print "Executing #{command.inspect}:"
        Kernel::system command
      end
    end
  end
end