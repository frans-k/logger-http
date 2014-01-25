# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'http_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "http_logger"
  spec.version       = HttpLogger::VERSION
  spec.authors       = ["Frans Krojegård"]
  spec.email         = ["frans@krojegard.com"]
  spec.description   = "A http logger"
  spec.summary       = "A Ruby logger over HTTP"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'net-http-persistent'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
