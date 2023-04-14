require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /homepage" do
    it 'should return a list of peeps with timestamps in html form' do
      response = get('/homepage')
  
      expect(response.status).to eq(200)
      expect(response.body).to include('Sunny ')
      expect(response.body).to include('Hi guys')
      expect(response.body).to include('France')
      expect(response.body).to include('hurray')
      expect(response.body).to include('Monkeys')
  
      # Check for peep timestamps
      # repo = PeepRepository.new
      # peeps = repo.all_with_timestamps
      # peeps.each do |peep|
      #   expect(response.body).to include(peep.message)
      #   expect(response.body).to include(peep.peep_time.to_s)
      # end
    end
  end
end

# expect(response.body).to include('France')
#       expect(response.body).to include('Hi guys')
#       expect(response.body).to include('Sunny day')
#       expect(response.body).to include('hurray')
#       expect(response.body).to include('Monkeys')