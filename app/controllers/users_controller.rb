class UsersController < ApplicationController

    def main
        
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'welcome', action: 'home'
    end
    
      private
    
        def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end
