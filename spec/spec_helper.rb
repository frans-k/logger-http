require 'minitest/autorun'
require File.expand_path('lib/logger-http')

if __FILE__ == $0
  #$LOAD_PATH.unshift('lib', 'spec')
  Dir.glob('./**/*_spec.rb') { |f| require f }
  Dir.glob('./*_spec.rb') { |f| require f }
end
