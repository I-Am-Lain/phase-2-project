class User < ApplicationRecord
    has_many :user_questions
    has_many :questions, through: :user_questions
    has_many :categories, through: :questions
<<<<<<< HEAD
end
=======

    has_secure_password

    validates :name, uniqueness: {case_sensitive: false}
end

# <!-- <%= image_tag @user.picture, alt: "Justin's Fabulous Picture" %> -->
# <li><%= image_tag u.picture, alt: "Justin's Fabulous Picture", size: "260x180" %></li>
>>>>>>> Justin
