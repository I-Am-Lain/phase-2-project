class Theme < ApplicationRecord
    belongs_to :user
    has_many :theme_categories
    has_many :categories, through: :theme_categories
    has_many :questions, through: :categories

    validates :title, :user_id, presence: true
    
  end