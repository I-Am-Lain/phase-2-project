class ApplicationController < ActionController::Base
  before_action :get_user
  
  def cart
    session[:cart] ||= []
  end

  def add_question_to_cart
    cart << params[:question_id]
  end

  def get_items_from_cart
    @cart_items = Question.find(cart)
  end

  # Finds the User with the ID stored in the session with the key
  # :get_user This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def get_user
    @_get_user ||= session[:get_user] &&
      User.find_by(id: session[:get_user])
  end

  
#   before_action :require_login
 
#   private
 
#   def require_login
#     unless logged_in?
#       flash[:error] = "You must be logged in to access this section"
#       redirect_to new_login_url # halts request cycle
#     end
#   end
end
