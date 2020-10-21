class CartController < ApplicationController
    def update
      flash[:notice] = "Success!"
     
      add_question_to_cart
     
      redirect_to questions_path
    end
  end