require 'json'
require_relative 'step'
require_relative 'support/build_metadata'
require_relative 'support/params'
require_relative 'support/work_dir'

module Fuselage
  class In < Step
    include Support::BuildMetadata
    include Support::Params
    include Support::WorkDir

    Contract None => HashOf[String, String]
    def version
      @version ||= config.fetch 'version'
    rescue KeyError
      STDERR.puts 'Configuration payload is missing version'
      abort
    end

    Contract None => ArrayOf[Maybe[HashOf[String, String]]]
    def metadata
      []
    end

    Contract None => String
    def output
      JSON.dump version: version, metadata: metadata
    end

    Contract None => Any
    def fetch!
      fail NotImplementedError
    end

    Contract None => String
    def run
      fetch!
      output
    end
  end
end
