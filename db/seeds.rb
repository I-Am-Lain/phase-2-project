# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'
require 'byebug'

response_string = RestClient.get("https://opentdb.com/api.php?amount=50&type=multiple") 
response_hash = JSON.parse(response_string)
question_data = response_hash["results"]

question_data.each do |que|
    Category.find_or_create_by(name: que["category"])
    
end



question_data.each do |que|
    Question.create(content: que["question"].encode("UTF-8"),
    difficulty: que["difficulty"],
    correct: que["correct_answer"],
    inc1: que["incorrect_answers"][0],
    inc2: que["incorrect_answers"][1],
    inc3: que["incorrect_answers"][2],
    category_id: Category.find_or_create_by(name: que["category"]).id)
end



# User.create(name: "William", picture: "https://i.pinimg.com/originals/fa/44/fd/fa44fda4399559fa9dc418c7bb390457.png", bio: "blehhhhh")
# User.create(name: "Justin", picture: "https://momandmore.com/wp-content/uploads/2014/09/morton-salt-girl-logo.png", bio: "yahoooooooooooooooooooooo")


UserQuestion.create(user_id: 1, question_id: 1)
UserQuestion.create(user_id: 2, question_id: 1)