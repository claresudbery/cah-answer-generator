ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../utils/answer_generator'
require 'rspec'

RSpec.describe 'The HelloWorld App' do
  
  it "reads answers" do
      answers = AnswerGenerator.new.read_safe_answers
      expect(answers[0]).to eq("Michelle Obama's arms.")
  end
end