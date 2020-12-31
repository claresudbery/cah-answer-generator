ENV['APP_ENV'] = 'test'

require "spec_helper"

require_relative '../utils/answer_generator'
require_relative 'const_strings'
require 'rspec'

RSpec.describe 'The HelloWorld App' do

  before(:each) do
    @randomiser_stub = double('Randomiser')
    @answerGenerator = AnswerGenerator.new(@randomiser_stub)
  end
  
  it "reads safe answers" do
      answers = @answerGenerator.read_safe_answers
      expect(answers[0]).to eq(ConstStrings::FIRST_SAFE_ANSWER)
      expect(answers[answers.length-1]).to eq(ConstStrings::LAST_SAFE_ANSWER)
  end
  
  it "reads kind-of-safe answers" do
      kind_of_safe_answers = @answerGenerator.read_kind_of_safe_answers
      expect(kind_of_safe_answers[0]).to eq(ConstStrings::FIRST_KIND_OF_SAFE_ANSWER)
      expect(kind_of_safe_answers[kind_of_safe_answers.length-1]).to eq(ConstStrings::LAST_KIND_OF_SAFE_ANSWER)
  end
  
  it "reads dangerous answers" do
      dangerous_answers = @answerGenerator.read_dangerous_answers
      expect(dangerous_answers[0]).to eq(ConstStrings::FIRST_DANGEROUS_ANSWER)
      expect(dangerous_answers[dangerous_answers.length-1]).to eq(ConstStrings::LAST_DANGEROUS_ANSWER)
  end
  
  it "chooses a random safe answer" do
      first_answer = 0
      allow(@randomiser_stub).to receive(:random_int).and_return(first_answer)
      random_safe_answer = @answerGenerator.choose_safe_answer
      expect(random_safe_answer).to eq(ConstStrings::FIRST_SAFE_ANSWER)
  end
  
  it "chooses a random kind-of-safe answer" do
      first_answer = 0
      allow(@randomiser_stub).to receive(:random_int).and_return(first_answer)
      random_kind_of_safe_answer = @answerGenerator.choose_kind_of_safe_answer
      expect(random_kind_of_safe_answer).to eq(ConstStrings::FIRST_KIND_OF_SAFE_ANSWER)
  end
  
  it "chooses a random dangerous answer" do
      first_answer = 0
      allow(@randomiser_stub).to receive(:random_int).and_return(first_answer)
      random_dangerous_answer = @answerGenerator.choose_dangerous_answer
      expect(random_dangerous_answer).to eq(ConstStrings::FIRST_DANGEROUS_ANSWER)
  end
end