# HttpLogger

A Ruby logger over HTTP. Uses PUT for logging, for now at least.

## Installation

Add this line to your application's Gemfile:

    gem 'http_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http_logger

## Usage

config.logger = HttpLogger.new('https://data.logentries.com', '/ACCOUNT_KEY/hosts/HOST/LOG/?realtime=1')

## TODO

- Buffer requests
- More methods than PUT?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
