require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String, :length => 3..50
  property :password, BCryptHash

  property :created_at, DateTime
  property :updated_at, DateTime

  def authenticate(attempted_password)
    self.password == attempted_password
  end
end
