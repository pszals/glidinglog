$LOAD_PATH.unshift(File.dirname(__FILE__))

require './config/setup'

class GlidingLog < Sinatra::Base
  enable :sessions
  use Rack::Flash, sweep: true

  get '/' do
    erb :index
  end

  post '/signup' do
    username = params["username"]

    if User.first(username: username) != nil
      flash[:error] = "Username already exists"
      redirect '/'
    else
      User.create(username: username, password: params["password"])
      redirect '/'
    end
  end
end
