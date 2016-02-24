require 'json'
require_relative 'step'

module Fuselage
  class Check < Step
    Contract None => Maybe[HashOf[String, String]]
    def version
      config['version']
    end

    Contract None => HashOf[String, String]
    def latest
      fail NotImplementedError
    end

    Contract HashOf[String, String] => ArrayOf[HashOf[String, String]]
    def since(version)
      fail NotImplementedError
    end

    Contract None => ArrayOf[HashOf[String, String]]
    def output
      version.nil? ? [latest] : since(version)
    end

    Contract None => String
    def run
      JSON.dump output
    end
  end
end
