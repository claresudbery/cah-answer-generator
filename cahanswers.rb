require "sinatra/base"
require "erb"

# This page created as part of this tutorial: http://webapps-for-beginners.rubymonstas.org/sinatra/params.html

# To start the app / spin up the server, run the following on the command line: rackup -p 4567
# Alternatively you can still just use: ruby cahanswers.rb

class MyApp < Sinatra::Base
    enable :sessions

    def store_name(filename, string)
        File.open(filename, "a+") do |file|
            file.puts(string)
        end
    end

    def read_answers
        return [] unless File.exist?("safe_answers.txt")
        File.read("all_answers.txt").split("\n")
    end

    class NameValidator    
        def initialize(name, answers)
            @name = name.to_s
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
            if @name.empty?
            @message = "You need to enter a name."
            elsif @answers.include?(@name)
            @message = "#{@name} is already included in our list."
            end
        end
    end

    # Visit http://127.0.0.1:4567 in the browser
    get '/' do
        "Hello World #{params[:name]}".strip
    end

    # Visit http://127.0.0.1:4567/cahanswers in the browser 
    get "/cahanswers" do
        @message = session.delete(:message)
        @name = params["name"]
        @answers = read_answers
        erb :cahanswers
    end

    # Visit http://127.0.0.1:4567/cahanswers in the browser and enter a name
    post "/cahanswers" do
        @name = params["name"]
        @answers = read_answers
        validator = NameValidator.new(@name, @answers)

        if validator.valid?
            store_name("all_answers.txt", @name)
            session[:message] = "Successfully stored the name #{@name}."
            redirect "/cahanswers?name=#{@name}"
        else
            @message = validator.message
            erb :cahanswers
        end
    end

    run! if app_file == $0
end