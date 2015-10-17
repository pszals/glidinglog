$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sinatra/base'
require 'tilt/erb'

class GlidingLog < Sinatra::Base

  get '/' do
    erb :index
  end
end
