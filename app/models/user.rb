class User < ApplicationRecord
    has_many :user_questions
    has_many :questions, through: :user_questions
    has_many :categories, through: :questions
end
