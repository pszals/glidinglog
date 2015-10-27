$LOAD_PATH.unshift(File.dirname(__FILE__))

require './config/setup'

class GlidingLog < Sinatra::Base
  enable :sessions
  use Rack::Flash, sweep: true
  use Rack::Session::Cookie, secret: ENV['rack_session_secret']
  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = GlidingLog
    manager.serialize_into_session {|user| user.id}
    manager.serialize_from_session {|id| User.get(id) }
  end

  Warden::Manager.before_failure do |env, opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  Warden::Strategies.add(:password) do
    def valid?
      params["username"] || params["password"]
    end

    def authenticate!
      user = User.first(username: params["username"])
      if user && user.authenticate(params["password"])
        success!(user)
      else
        fail!("Could not log in")
      end
    end
  end

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
      redirect '/login'
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    warden.authenticate!

    authenticate
    redirect '/flights'
  end

  get '/flights' do
    authenticate
    erb :flights
  end

  def warden
    env['warden']
  end

  def current_user
    warden.user
  end

  def authenticate
    redirect '/login' unless warden.authenticated?
  end
end
