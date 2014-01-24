require 'net/http/persistent'

module HttpLogger::Put
  def self.new path, message
    @path = path
    Net::HTTP::Put.new(@path).tap do |r|
      r.body = "#{message}\n"
    end
  end
end
