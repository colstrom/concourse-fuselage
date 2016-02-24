require 'contracts'

module Fuselage
  module Support
    module WorkDir
      include ::Contracts::Core
      include ::Contracts::Builtin

      Contract None => String
      def workdir
        @workdir ||= ARGV.first.tap do |workdir|
          fail ArgumentError if workdir.nil?
        end
      rescue ArgumentError
        STDERR.puts 'Working directory missing, expected as first argument'
        abort
      end
    end
  end
end
