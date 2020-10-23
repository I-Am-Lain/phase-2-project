class ThemesController < ApplicationController
    before_action :require_login
    

    def index
        @themes = @user.themes
    end

    def new
        @theme = @user.themes.new
    end

    def create
        @theme = @user.themes.create(theme_params)

        params[:theme][:category_ids].each do |c|

            if c != ""
                ThemeCategory.create(theme_id: @theme.id, category_id: c)
            end
        end

        #byebug

        if @theme.valid?
            flash[:alert] = "Create Set was successful"
            redirect_to user_themes_path
        else
            flash[:alert] = "Create Set was NOT successful :("
            redirect_to new_user_theme_path
        end
    end
    

    private

    def theme_params
        params.require(:theme).permit(:title, :user_id)
    end
end