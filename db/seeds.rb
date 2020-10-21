# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'
<<<<<<< HEAD

# REFER TO API DOC FOR ESCAPING ''
response_string = RestClient.get("https://opentdb.com/api.php?amount=50&type=multiple")
=======
require 'byebug'

response_string = RestClient.get("https://opentdb.com/api.php?amount=50&type=multiple") 
>>>>>>> Justin
response_hash = JSON.parse(response_string)
question_data = response_hash["results"]

question_data.each do |que|
    Category.find_or_create_by(name: que["category"])
<<<<<<< HEAD
end

# create new question in db as user creates a question
# join table to assoc question
# user authe    store user id in session, create UserQuestion with current session[:user_id] and the question

question_data.each do |que|
    Question.create(content: que["question"],
=======
    
end



question_data.each do |que|
    Question.create(content: que["question"].encode("UTF-8"),
>>>>>>> Justin
    difficulty: que["difficulty"],
    correct: que["correct_answer"],
    inc1: que["incorrect_answers"][0],
    inc2: que["incorrect_answers"][1],
    inc3: que["incorrect_answers"][2],
    category_id: Category.find_or_create_by(name: que["category"]).id)
end



<<<<<<< HEAD
User.create(name: "William", picture: "https://i.pinimg.com/originals/fa/44/fd/fa44fda4399559fa9dc418c7bb390457.png", bio: "blehhhhh")
User.create(name: "Justin", picture: "https://momandmore.com/wp-content/uploads/2014/09/morton-salt-girl-logo.png", bio: "yahoooooooooooooooooooooo")
=======
# User.create(name: "William", picture: "https://i.pinimg.com/originals/fa/44/fd/fa44fda4399559fa9dc418c7bb390457.png", bio: "blehhhhh")
# User.create(name: "Justin", picture: "https://momandmore.com/wp-content/uploads/2014/09/morton-salt-girl-logo.png", bio: "yahoooooooooooooooooooooo")
>>>>>>> Justin


UserQuestion.create(user_id: 1, question_id: 1)
UserQuestion.create(user_id: 2, question_id: 1)