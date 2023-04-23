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
    end
  end
  
  context 'GET /login' do
    it "displays the login form" do
      get '/login'
      expect(last_response).to be_ok #another way of saying .to eq(200)
      expect(last_response.body).to include("Email")
      expect(last_response.body).to include("Password")
    end

    it "logs in the user" do
      post '/login', email: 'user@example.com', password: 'password'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end

  context 'GET /register' do
    it "displays the register form" do
      get '/register'
      expect(last_response).to be_ok # wouldn't work as .to eq 200 as GET /register route is failing because the response status is not equal to 200. It looks like the response is returning a Rack::MockResponse object, which is not equal to the integer value 200.
      expect(last_response.body).to include("Name")
      expect(last_response.body).to include("Email")
      expect(last_response.body).to include("Password")
    end

    it "registers in the user" do
      post '/register',name:'name', email: 'user@example.com', password: 'password'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/')
    end
  end

  context 'GET /logout' do
    it "displays the logout page" do
      get '/logout'

    end
  end
end

