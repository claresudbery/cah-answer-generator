ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../utils/answer_generator'
require 'rspec'

RSpec.describe 'The HelloWorld App' do

  before(:each) do
    @FIRST_SAFE_ANSWER = "Michelle Obama's arms."
    @LAST_SAFE_ANSWER = "Clubbin seals"
    @FIRST_KIND_OF_SAFE_ANSWER = "Flying sex snakes."
    @LAST_KIND_OF_SAFE_ANSWER = "An intellectually superior overlord"
    @FIRST_DANGEROUS_ANSWER = "German dungeon porn."
    @LAST_DANGEROUS_ANSWER = "Lightsaber Dildos"

    @randomiser_stub = double('Randomiser')
    allow(@randomiser_stub).to receive(:random_int).and_return(0)
  end
  
  it "reads safe answers" do
      answers = AnswerGenerator.new(Randomiser.new).read_safe_answers
      expect(answers[0]).to eq(@FIRST_SAFE_ANSWER)
      expect(answers[answers.length-1]).to eq(@LAST_SAFE_ANSWER)
  end
  
  it "reads kind-of-safe answers" do
      kind_of_safe_answers = AnswerGenerator.new(Randomiser.new).read_kind_of_safe_answers
      expect(kind_of_safe_answers[0]).to eq(@FIRST_KIND_OF_SAFE_ANSWER)
      expect(kind_of_safe_answers[kind_of_safe_answers.length-1]).to eq(@LAST_KIND_OF_SAFE_ANSWER)
  end
  
  it "reads dangerous answers" do
      dangerous_answers = AnswerGenerator.new(Randomiser.new).read_dangerous_answers
      expect(dangerous_answers[0]).to eq(@FIRST_DANGEROUS_ANSWER)
      expect(dangerous_answers[dangerous_answers.length-1]).to eq(@LAST_DANGEROUS_ANSWER)
  end
  
  it "chooses a random safe answer" do
  end
end