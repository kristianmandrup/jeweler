class Jeweler
  module Commands
    class InstallGem < Executor
      attr_accessor :gemspec_helper

      def initialize
        super
      end

      def run
        system_exec  "#{gem_command} install #{gemspec_helper.gem_path}"
      end

      def gem_command
        "#{Config::CONFIG['RUBY_INSTALL_NAME']} -S gem"
      end

      def self.build_for(jeweler)
        command = new
        command.output = jeweler.output
        command.gemspec_helper = jeweler.gemspec_helper
        command
      end
    end
  end
end
