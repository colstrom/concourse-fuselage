require 'json'
require_relative 'step'
require_relative 'support/build_metadata'
require_relative 'support/params'
require_relative 'support/work_dir'

module Fuselage
  class Out < Step
    include Support::BuildMetadata
    include Support::Params
    include Support::WorkDir

    Contract None => HashOf[String, String]
    def version
      fail NotImplementedError
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
    def update!
      fail NotImplementedError
    end

    Contract None => String
    def run
      update!
      output
    end
  end
end
