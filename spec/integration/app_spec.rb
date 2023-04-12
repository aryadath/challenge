require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # context 'POST/peeps' do
  #   xit 'create a peep' do  # this creates the peep
  #     response = post('/peeps', text: "My first post!")

  #     expect(response.status).to eq 200
  #     expect(response.body).to eq('') # here we get no response YET

  #     response = get('/peeps') # gets list of peeps

  #     expect(response.body).to include("My first post!") # checks if peep has text to ensure it has been added to db
  #   end
  # end

end
