require 'rest-client'
require 'json'
require 'byebug'


def question_time(response_string)
    response_hash = JSON.parse(response_string)

    c = Category.create(name: response_hash["title"])

    response_hash["clues"].each do |que|
        Question.create(content: que["question"],
        difficulty: que["value"],
        correct: que["answer"],
        inc1: "mydefault A",
        inc2: "mydefault B",
        inc3: "mydefault C",
        category_id: c.id)
    end
  end

# response_string = RestClient.get("https://opentdb.com/api.php?amount=50&type=multiple") 
# response_hash = JSON.parse(response_string)
# question_data = response_hash["results"]

# question_data.each do |que|
#     Category.find_or_create_by(name: que["category"])
    
# end

# question_data.each do |que|
#     Question.create(content: que["question"].encode("UTF-8"),
#     difficulty: que["difficulty"],
#     correct: que["correct_answer"],
#     inc1: que["incorrect_answers"][0],
#     inc2: que["incorrect_answers"][1],
#     inc3: que["incorrect_answers"][2],
#     category_id: Category.find_or_create_by(name: que["category"]).id)
# end

response_string = RestClient.get("http://jservice.io/api/category?id=306") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=136") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=42") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=780") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=21") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=105") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=25") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=103") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=7") 
question_time(response_string)
response_string = RestClient.get("http://jservice.io/api/category?id=442") 
question_time(response_string)

#either take the incorrects off of model (but then we can't do multiple choice)
