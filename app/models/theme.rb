class Theme < ApplicationRecord
    belongs_to :user
    has_many :theme_categories
    has_many :categories, through: :theme_categories
    has_many :questions, through: :categories
    accepts_nested_attributes_for :categories

    validates :title, :user_id, presence: true
    
  end