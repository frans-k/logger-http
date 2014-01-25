require 'net/http/persistent'

module Logger::HTTP::Put
  def self.new path, message
    @path = path
    Net::HTTP::Put.new(@path).tap do |r|
      r.body = "#{message}"
    end
  end
end
