describe HttpLogger do
  def init
    HttpLogger.new 'https://logging-service.dev', '/data/api-key'
  end

  it 'initializes successfully' do
    init.must_be_instance_of Logger
  end
end
