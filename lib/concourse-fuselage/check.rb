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

    Contract None => String
    def output
      JSON.dump version.nil? ? [latest] : since(version)
    end
  end
end
