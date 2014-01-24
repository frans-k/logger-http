class HttpLogger::Base
  def initialize(base_uri, path, request_source, debug: false)
    @base_uri = URI.parse(base_uri)
    @path = path
    @debug_logger = Logger.new('log/http_logger.log') if debug
    @request_source = request_source
    @queue = Queue.new
    dbg "initialized"
  end

  def write(message)
    dbg "queueing message"
    start

    @queue << "#{message}\n"
  rescue StandardError => e
    dbg "#{self.class} - #{e.class} - #{e.message}"
    close
  end

  def start
    @thread ||= Thread.new { run }
    @thread = Thread.new { run } unless @thread.alive?
    dbg "thread is #{@thread.status}"
  end

  def dbg message
    @debug_logger && @debug_logger.debug(message)
  end

  def run
    dbg "running loop"

    loop do
      data = @queue.pop
      dbg "popped #{data}"

      unless data
        dbg "no data!"
        sleep 3
        next
      end

      dbg "Sending message"
      request(data)
    end

  rescue StandardError
    dbg("Got exception in run loop - #{ $! }")
    raise
  end

  def close
    stop
    connection && connection.finish
  rescue StandardError => e
    dbg "#{self.class} - #{e.class} - #{e.message}"
  end

  def request data
    put = @request_source.new(@path, data)
    connection.request @base_uri + @path, put
  end

  private
  def connection
    return @connection if @connection
    @connection = Net::HTTP::Persistent.new('logger').tap do |c|
      c.read_timeout = 0.01
    end
  end
end
