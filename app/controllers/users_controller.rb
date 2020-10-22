class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :index, :show]
    # i think this cancels out

    def new
        if @user.id
            flash[:alert] = "You are already signed up"
            redirect_to '/'
        end
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
        
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'index'
    end

    def update
        @user.update(user_params)

        if @user.valid?
            flash[:alert] = "SUCCESSFUL EDIT BRO :))))"
            redirect_to user_path(@user)
        else
            flash[:alert] = "Edit was unsuccessful..."
            redirect_to edit_user_path
        end
    end

    def destroy
        @user.destroy
        redirect_to '/'
    end
    
      private
    
        def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :bio, :picture)
      end
end
