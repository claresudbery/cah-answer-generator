require "sinatra/base"
require "erb"

# This page created as part of this tutorial: http://webapps-for-beginners.rubymonstas.org/sinatra/params.html

# To start the app / spin up the server, run the following on the command line: rackup -p 4567
# Alternatively you can still just use: ruby cahanswers.rb

class MyApp < Sinatra::Base
    enable :sessions

    def store_answer(filename, string)
        File.open(filename, "a+") do |file|
            file.puts(string)
        end
    end

    def read_answers
        return [] unless File.exist?("safe_answers.txt")
        File.read("safe_answers.txt").split("\n")
    end

    class AnswerValidator    
        def initialize(answer, answers)
            @answer = answer.to_s
            @answers = answers
        end

        def valid?
            validate
            @message.nil?
        end

        def message
            @message
        end

        private

        def validate
            if @answer.empty?
            @message = "You need to enter an answer."
            elsif @answers.include?(@answer)
            @message = "#{@answer} is already included in our list."
            end
        end
    end

    # Visit http://127.0.0.1:4567 in the browser
    get '/' do
        "Hello World #{params[:answer]}".strip
    end

    # Visit http://127.0.0.1:4567/cahanswers in the browser 
    get "/cahanswers" do
        @message = session.delete(:message)
        @answer = params["answer"]
        @answers = read_answers
        erb :cahanswers
    end

    # Visit http://127.0.0.1:4567/cahanswers in the browser and enter an answer
    post "/cahanswers" do
        @answer = params["answer"]
        @answers = read_answers
        validator = AnswerValidator.new(@answer, @answers)

        if validator.valid?
            store_answer("safe_answers.txt", @answer)
            session[:message] = "Successfully stored the answer #{@answer}."
            redirect "/cahanswers?answer=#{@answer}"
        else
            @message = validator.message
            erb :cahanswers
        end
    end

    run! if app_file == $0
end