class Question < ApplicationRecord
  belongs_to :category
  has_many :user_questions
  has_many :users, through: :user_questions
end
