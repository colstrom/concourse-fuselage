require 'contracts'
require_relative 'config'

module Fuselage
  module Support
    module Source
      include ::Contracts::Core
      include ::Contracts::Builtin
      include Config

      Contract None => Hash
      def source
        @source ||= config.fetch 'source', {}
      end
    end
  end
end
