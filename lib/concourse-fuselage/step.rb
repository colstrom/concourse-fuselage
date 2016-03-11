require 'contracts'
require_relative 'support/source'
require_relative 'support/debugging'

module Fuselage
  class Step
    include ::Contracts::Core
    include ::Contracts::Builtin
    include Support::Source
    include Support::Debugging
  end
end
