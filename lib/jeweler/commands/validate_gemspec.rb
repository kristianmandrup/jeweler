class Jeweler
  module Commands
    class ValidateGemspec < Executor
      attr_accessor :gemspec_helper

      def initialize
        super
      end

      def run
        begin
          gemspec_helper.parse
          print "#{gemspec_helper.path} is valid."
        rescue Exception => e
          print "#{gemspec_helper.path} is invalid. See the backtrace for more details."
          raise
        end
      end

      def self.build_for(jeweler)
        command = new

        command.gemspec_helper = jeweler.gemspec_helper
        command.output = jeweler.output

        command
      end
    end
  end
end
