class AnswerGenerator

    def initialize(randomiser)
        @randomiser = randomiser
    end

    def read_safe_answers
        return [] unless File.exist?("safe_answers.txt")
        File.read("safe_answers.txt").split("\n")
    end

    def read_kind_of_safe_answers
        return [] unless File.exist?("kind_of_safe_answers.txt")
        File.read("kind_of_safe_answers.txt").split("\n")
    end

    def read_dangerous_answers
        return [] unless File.exist?("all_answers.txt")
        File.read("all_answers.txt").split("\n")
    end

    def choose_safe_answer
        answers = read_safe_answers
        answers[@randomiser.random_int(answers.length)]
    end
end