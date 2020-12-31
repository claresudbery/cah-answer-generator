require "sinatra/base"
require "erb"

# This page created as part of this tutorial: http://webapps-for-beginners.rubymonstas.org/sinatra/params.html

# To start the app / spin up the server, run the following on the command line: rackup -p 4567
# Alternatively you can still just use: ruby cahanswers.rb

class MyApp < Sinatra::Base
    enable :sessions

    DEFAULT_ANSWER = "There is no answer without a question!"
    SAFE_ANSWER = "Give me a safe answer"

    def read_answers
        return [] unless File.exist?("safe_answers.txt")
        File.read("safe_answers.txt").split("\n")
    end

    def choose_answer
        answers = read_answers
        answers[Kernel.rand(answers.length)]
        #answers[0]
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
        @answer = choose_answer
        erb :cahanswers
    end

    run! if app_file == $0
end