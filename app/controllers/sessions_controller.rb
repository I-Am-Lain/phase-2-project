class SessionsController < ApplicationController 
  before_action :current_user, :require_login
  skip_before_action :require_login, only: [:create, :new, :signup]
  #i think we don't need the above, both lines cancel each other out


  def new
  end

  def create 
    user = User.find_by(name: params[:session][:name])
  

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else  
      flash[:alert] = "Invalid credentials"
      redirect_to(controller: 'sessions', action: 'new')
    end 
    
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
  
end
