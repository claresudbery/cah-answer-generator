require "sinatra/base"
require "erb"

# This page created as part of this tutorial: http://webapps-for-beginners.rubymonstas.org/sinatra/params.html

# To start the app / spin up the server, run the following on the command line: rackup -p 4567
# Alternatively you can still just use: ruby cahanswers.rb

class MyApp < Sinatra::Base
    enable :sessions

    DEFAULT_ANSWER = "There is no answer without a question!"
    SAFE_ANSWER = "Give me a safe answer"

    def store_answer(filename, string)
        File.open(filename, "a+") do |file|
            file.puts(string)
        end
    end

    def read_answers
        return [] unless File.exist?("safe_answers.txt")
        File.read("safe_answers.txt").split("\n")
    end

    def choose_answer(answers)
        #answers[Kernel.rand(answers.length)]
        answers[0]
    end

    class AnswerValidator    
        def initialize(answer, answers)
            @answer = answer.to_s
            @answers = answers
        end

        def valid?
            @message = "some text."
            @message.nil?
        end

        def message
            @message
        end

        private
    end

    # Visit http://127.0.0.1:4567 in the browser
    get '/' do
        "Hello World #{params[:answer]}".strip
    end

    # Visit http://127.0.0.1:4567/cahanswers in the browser 
    get "/cahanswers" do
        @answer = DEFAULT_ANSWER
        erb :cahanswers
    end

    # Visit http://127.0.0.1:4567/cahanswers in the browser and enter an answer
    post "/cahanswers" do
        @answers = read_answers
        @answer = choose_answer(@answers)
        validator = AnswerValidator.new(@answer, @answers)
        puts "posted again"

        if validator.valid?
            store_answer("safe_answers.txt", @answer)
            puts "about to redirect"
            redirect "/cahanswers?answer=#{@answer}"
        else
            puts "Validator not valid."
            erb :cahanswers
        end
    end

    run! if app_file == $0
end