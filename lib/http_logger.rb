require "http_logger/version"
require 'http_logger/put'
require 'http_logger/base'

require 'logger'

module HttpLogger
  def self.new(base_uri, path)
    Logger.new(::HttpLogger::Base.new(base_uri, path, HttpLogger::Put))
  end
end

