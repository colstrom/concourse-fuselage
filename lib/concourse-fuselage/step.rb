require 'contracts'
require_relative 'support/source'

module Fuselage
  class Step
    include ::Contracts::Core
    include ::Contracts::Builtin
    include Support::Source
  end
end
