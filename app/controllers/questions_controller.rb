class QuestionsController < ApplicationController
    before_action :get_items_from_cart
    before_action :require_login

    def index
        @questions = Question.all
        @question = Question.new

    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        
        if @question.save
            flash[:error] = "Great Job! That was added to our database"
            
            redirect_to questions_path
        else
            flash[:error] = @question.errors.full_messages

            render :new
        end
    end



    private

    def question_params
        params.require(:question).permit(:content, :difficulty, :inc1, :inc2, :inc3, :correct, :category_id)
    end

end
