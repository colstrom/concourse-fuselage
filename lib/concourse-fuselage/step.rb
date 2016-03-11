require 'contracts'
require_relative 'support/source'
require_relative 'support/debugging'
require_relative 'support/validation'

module Fuselage
  class Step
    include ::Contracts::Core
    include ::Contracts::Builtin
    include Support::Source
    include Support::Debugging
    include Support::Validation

    def run
      validated(output)
        .tap { |string| STDOUT.puts string }
        .tap { |string| STDERR.puts string if debugging? }
    end
  end
end
