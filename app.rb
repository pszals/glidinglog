$LOAD_PATH.unshift(File.dirname(__FILE__))

require './config/setup'

class GlidingLog < Sinatra::Base

  get '/' do
    erb :index
  end
end
