class User < ApplicationRecord
    has_many :user_questions
    has_many :questions, through: :user_questions
    has_many :categories, through: :questions

    has_secure_password

    validates :name, uniqueness: {case_sensitive: false}
    validates :name, :bio, :picture, presence: true
end


