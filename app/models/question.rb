class Question < ApplicationRecord
  belongs_to :category
  has_many :user_questions
  has_many :users, through: :user_questions
  validates :content, :difficulty, :inc1, :inc2, :inc3, :correct, :category_id, presence: true
end