require 'contracts'
require 'json'

module Fuselage
  module Support
    module Config
      include ::Contracts::Core
      include ::Contracts::Builtin

      Contract None => Hash
      def config
        @config ||= (JSON.load STDIN || {}).tap do |payload|
          File.write 'config.json', payload if debugging?
        end
      end
    end
  end
end
