require 'contracts'

module Fuselage
  module Support
    module BuildMetadata
      include ::Contracts::Core
      include ::Contracts::Builtin

      Contract None => String
      def build_id
        ENV.fetch 'BUILD_ID'
      rescue KeyError
        STDERR.puts 'Environment is missing BUILD_ID'
        abort
      end

      Contract None => String
      def build_name
        ENV.fetch 'BUILD_NAME'
      rescue KeyError
        STDERR.puts 'Environment is missing BUILD_NAME'
        abort
      end

      Contract None => String
      def build_job_name
        ENV.fetch 'BUILD_JOB_NAME'
      rescue KeyError
        STDERR.puts 'Environment is missing BUILD_JOB_NAME'
        abort
      end

      Contract None => String
      def build_pipeline_name
        ENV.fetch 'BUILD_PIPELINE_NAME'
      rescue KeyError
        STDERR.puts 'Environment is missing BUILD_PIPELINE_NAME'
        abort
      end

      Contract None => String
      def atc_external_url
        ENV.fetch 'ATC_EXTERNAL_URL'
      rescue KeyError
        STDERR.puts 'Environment is missing ATC_EXTERNAL_URL'
        abort
      end
    end
  end
end
