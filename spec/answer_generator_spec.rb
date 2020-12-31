ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../utils/answer_generator'
require 'rspec'

RSpec.describe 'The HelloWorld App' do
  
  it "reads safe answers" do
      answers = AnswerGenerator.new.read_safe_answers
      expect(answers[0]).to eq("Michelle Obama's arms.")
      expect(answers[answers.length-1]).to eq("Clubbin seals")
  end
  
  it "reads kind-of-safe answers" do
      kind_of_safe_answers = AnswerGenerator.new.read_kind_of_safe_answers
      expect(kind_of_safe_answers[0]).to eq("Flying sex snakes.")
      expect(kind_of_safe_answers[kind_of_safe_answers.length-1]).to eq("An intellectually superior overlord")
  end
end