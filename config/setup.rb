require 'sinatra/base'
require 'tilt/erb'
require 'data_mapper'
require 'envyable'
require 'models/user'
require 'rack-flash'
require 'warden'

Envyable.load('./config/env.yml', 'development')

DataMapper.setup(:default, ENV["postgres_url"])
DataMapper.finalize
DataMapper.auto_upgrade!
