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
end

# _with_timestamps(DatabaseConnection)