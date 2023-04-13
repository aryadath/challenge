require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_tables # the tables are reset so we extract info from the tbale after its been updated-can take in new data
    seed.sql = File.read('chitter_seed.sql') 
    connection = PG.connect({host: '127.0.0.1', dbname: 'chitter_test'})
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end
end

