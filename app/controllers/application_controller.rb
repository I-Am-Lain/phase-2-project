require 'byebug'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action  :require_login 
  helper_method :require_login, :current_user  

  
  
  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      # redirect_to(controller: 'sessions', action: 'new')# halts request cycle
    end
  end

  def cart
    session[:cart] ||= []
  end

  def add_question_to_cart
    cart << params[:question_id]
  end

  def get_items_from_cart
    @cart_items = Question.find(cart)
  end
end
