class SessionsController < ApplicationController 
  before_action :current_user, :require_login
  skip_before_action :require_login, only: [:create, :new, :signup]

  def new
  end

  def create 
    user = User.find_by(name: params[:session][:name])
  
    session[:user_id] = user.id
    @current_user = user

    if user && user.authenticate(params[:session][:password])
      redirect_to user_path(user)
    else  
    redirect_to(controller: 'sessions', action: 'new')
    end 
    
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
  
end
