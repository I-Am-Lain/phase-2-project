class Question < ApplicationRecord
  belongs_to :category

  validates :content, :difficulty, :inc1, :inc2, :inc3, :correct, :category_id, presence: true
end