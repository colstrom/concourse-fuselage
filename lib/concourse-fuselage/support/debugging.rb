require 'contracts'
require_relative 'source'

module Fuselage
  module Support
    module Debugging
      include ::Contracts::Core
      include ::Contracts::Builtin
      include Source

      Contract None => Maybe[Or[Bool, String]]
      def debug
        source['debug']
      end

      Contract None => Bool
      def debugging?
        !!debug
      end
    end
  end
end
