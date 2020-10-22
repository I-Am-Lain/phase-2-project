class ThemeCategory < ApplicationRecord
    belongs_to :theme
    belongs_to :category

    validates :theme_id, :category_id, presence: true

end
