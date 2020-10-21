class SessionsController < ApplicationController 
  skip_before_action :require_login, only: [:create, :new, :signup]

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])

    session[:user_id] = user.id
    @user = user

    if user && user.authenticate(params[:user][:password])
      redirect_to controller: 'welcome', action: 'home'
    else  
    redirect_to(controller: 'sessions', action: 'new')
    end 
    
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end
  
end
