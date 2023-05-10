require 'bcrypt'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peeps_repository'
require_relative 'lib/users_repository'

# file: app.rb

require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('peeps')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, message,peep_time,user_id FROM peeps;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end


  get "/homepage" do
    repo = PeepRepository.new
    @peeps = repo.all 
    return erb(:homepage)
  end

  get '/login' do
    erb :login
  end
  
  post '/login' do
    email = params[:email]
    password = params[:password]
  
    # Your authentication login here
  
    redirect '/'
  end

  get '/register' do
    return erb(:register)
  end

  post '/register' do
    hashed_password = BCrypt::Password.create(params[:password])
    name = params[:name]
    email = params[:email]
  
    user = User.new(name: name, email: email, hashed_password: hashed_password.to_s)
    UserRepository.new.save(user)
  
    redirect '/'
  end

  get '/logout' do
    return erb(:logout)
  end
end