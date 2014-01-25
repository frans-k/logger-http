require "logger-http/version"
require 'logger-http/put'
require 'logger-http/base'

require 'logger'

module Logger::HTTP
  def self.new(base_uri, path, debug: false)
    Logger.new(::Logger::HTTP::Base.new(base_uri, path, Logger::HTTP::Put, debug: debug))
  end
end
