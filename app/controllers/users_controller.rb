class UsersController < ApplicationController
<<<<<<< HEAD
=======
    # before_action :require_login
    # skip_before_action :require_login, only: [:new, :create]
>>>>>>> Justin

    def main
        
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def create 
        @user = User.create(user_params)
        # if @user.after_save

        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'user', action: 'index'
    end
    
      private
    
        def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end
