require 'contracts'
require_relative 'config'

module Fuselage
  module Support
    module Params
      include ::Contracts::Core
      include ::Contracts::Builtin
      include Config

      Contract None => Hash
      def params
        @params ||= config.fetch 'params', {}
      end
    end
  end
end
