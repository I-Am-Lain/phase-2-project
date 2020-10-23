class GameController < ApplicationController
    before_action :require_login
    skip_before_action :verify_authenticity_token

    def options  # i.e. the "Loadout" before game

    end

    def play
        @theme = Theme.find(params[:theme_category][:theme_id])
        @result = Result.new
    end

    def end
    

    end



end
