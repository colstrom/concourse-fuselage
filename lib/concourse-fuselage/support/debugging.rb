require 'contracts'
require_relative 'source'

module Fuselage
  module Support
    module Debugging
      include ::Contracts::Core
      include ::Contracts::Builtin
      include Source
    end
  end
end
