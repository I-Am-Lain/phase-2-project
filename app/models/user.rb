class User < ApplicationRecord
    has_many :themes
    has_many :categories, through: :themes
    has_many :questions, through: :categories

    has_secure_password

    validates :name, uniqueness: {case_sensitive: false}
    validates :name, :bio, :picture, presence: true
end


