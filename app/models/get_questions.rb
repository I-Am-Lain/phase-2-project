require 'rest-client'
require 'json'
require 'byebug'
require_relative "question.rb"


class GetQuestions < ApplicationRecord
    def get_questions
        response_string = RestClient.get("https://opentdb.com/api.php?amount=50&type=multiple")
        response_hash = JSON.parse(response_string)
        question_data = response_hash["results"]
    end
end

programs = GetQuestions.new.get_questions

programs.each do |q|
    Question.create(content: q["question"])   
end


# category
# type
# difficulty
# question
# correct_answer
# incorrect_answers => []