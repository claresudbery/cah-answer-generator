ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../cahanswers'
require_relative 'const_strings'
require 'rspec'
require 'rack/test'

RSpec.describe 'The HelloWorld App' do
    include Rack::Test::Methods
  
    def app
      MyApp
    end

    def it_returns_200
      expect(last_response).to be_ok
    end

    def it_shows_all_buttons_and_default_answer
      it_shows_all_buttons
      it_shows_default_answer
    end

    def it_shows_all_buttons
      expect(last_response.body).to include(MyApp::SAFE_ANSWER_BUTTON_TEXT)
    end

    def it_shows_default_answer
      expect(last_response.body).to include(MyApp::DEFAULT_ANSWER)
    end
  
    context "root route" do
      it "returns 200 on get" do
        get '/'
        it_returns_200
      end
    end
  
    it "returns 200 on get" do
      get '/cahanswers'
      it_returns_200
    end
  
    it "shows default answer and all buttons" do
      get '/cahanswers'
      it_shows_all_buttons_and_default_answer
    end
  
    it "changes the answer when you ask for a safe answer" do
      get '/cahanswers'
      post '/safe'
      expect(last_response.body).not_to include(MyApp::DEFAULT_ANSWER)
    end
end