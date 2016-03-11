require 'contracts'
require 'json'

module Fuselage
  module Support
    # Payload validation for Resource
    module Validation
      include ::Contracts::Core
      include ::Contracts::Builtin

      Contract String => String
      def validated(payload)
        return payload unless malformed? payload

        STDERR.puts 'Resource failed to produce valid JSON', payload
        abort
      end

      Contract String => Bool
      def valid?(payload)
        JSON.parse payload
        true
      rescue JSON::ParseError
        false
      end

      Contract String => Bool
      def malformed?(payload)
        !valid? payload
      end
    end
  end
end
