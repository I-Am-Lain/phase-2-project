class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action  :current_user
  helper_method :require_login, :current_user, :logged_in

  $NETFLIX = ["https://static6.depositphotos.com/1085342/582/i/450/depositphotos_5821641-stock-photo-funny-guy-pointing-up.jpg",
  "https://thumbs.dreamstime.com/b/pointing-to-camera-funny-little-boy-one-eye-closed-isolated-over-yellow-background-63656336.jpg",
  "https://i.pinimg.com/474x/9b/e0/dd/9be0dd55b5976504186558ac71c4035e.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/4/4a/Alexandria_Ocasio-Cortez_Official_Portrait.jpg"]

  
  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in
    current_user.id != nil
  end

  def require_login
    unless logged_in 
    flash[:alert] = "You must be logged in for swag."
    redirect_to(controller: 'sessions', action: 'new') # halts request cycle
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
