class Jeweler
  module Commands
    class ReleaseToRubygems < Executor
      attr_accessor :gemspec, :version, :output, :gemspec_helper

      def initialize
        super
      end

      def run
        system_exec "gem push #{@gemspec_helper.gem_path}"
      end

      def self.build_for(jeweler)
        command = new
        command.gemspec        = jeweler.gemspec
        command.gemspec_helper = jeweler.gemspec_helper
        command.version        = jeweler.version
        command.output         = jeweler.output
        command
      end
    end
  end
end
