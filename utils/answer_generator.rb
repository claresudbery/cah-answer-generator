class AnswerGenerator

    def read_safe_answers
        return [] unless File.exist?("safe_answers.txt")
        File.read("safe_answers.txt").split("\n")
    end

    def choose_answer
        answers = read_safe_answers
        #answers[Kernel.rand(answers.length)]
        answers[0]
    end
end