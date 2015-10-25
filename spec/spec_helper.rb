require 'bundler'
require './app'

Bundler.require(:test)

Envyable.load('./config/env.yml', 'test')

DataMapper.setup(:default, ENV["postgres_url"])
DataMapper.finalize
DataMapper.auto_upgrade!

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

