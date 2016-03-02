$LOAD_PATH.unshift(File.dirname(__FILE__))

require './base'

class GlidingLog < Base
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
      redirect '/flights'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    warden.authenticate!

    redirect '/flights'
  end

  get '/flights' do
    warden.authenticate!

    erb :flights
  end

  post '/upload_flight' do
  end

  post '/unauthenticated' do
    redirect to('/login')
  end
end
