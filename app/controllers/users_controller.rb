class UsersController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:new, :create]

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

        unless @user.save
            flash[:alert] = "Invalid Sign-In"
            return redirect_to signup_path
        end
        # return redirect_to controller: 'users', action: 'new' unless @user.save
        
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'index'
    end
    
      private
    
        def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :bio, :picture)
      end
end
