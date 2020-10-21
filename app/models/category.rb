class Category < ApplicationRecord
    has_many :questions

    def list_of_users
        UserQuestion.all.map do |uq|
            if uq.question.category_id == self.id 
                uq.user
            end
        end
    end
end