ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../cahanswers'
require 'rspec'
require 'rack/test'

RSpec.describe 'The HelloWorld App' do
    include Rack::Test::Methods
  
    def app
      MyApp
    end
  
    it "says hello" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq('Hello World')
    end
  
    it "gets basic cahanswers route successfully" do
      get '/cahanswers'
      expect(last_response).to be_ok
    end
  
    it "shows a safe answer button" do
      get '/cahanswers'
      expect(last_response.body).to include(MyApp::SAFE_ANSWER)
    end
  
    it "shows default answer on GET" do
      get '/cahanswers'
      expect(last_response.body).to include(MyApp::DEFAULT_ANSWER)
    end
  
    it "shows a submit button" do
      get '/cahanswers'
      expect(last_response.body).to include('submit')
    end
end