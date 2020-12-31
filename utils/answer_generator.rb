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
        safe_answers = read_safe_answers
        safe_answers[@randomiser.random_int(safe_answers.length)]
    end

    def choose_kind_of_safe_answer
        kind_of_safe_answers = read_kind_of_safe_answers
        kind_of_safe_answers[@randomiser.random_int(kind_of_safe_answers.length)]
    end

    def choose_dangerous_answer
        dangerous_answers = read_dangerous_answers
        dangerous_answers[@randomiser.random_int(dangerous_answers.length)]
    end
end