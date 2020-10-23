class GameController < ApplicationController
    before_action :require_login

    def options  # i.e. the "Loadout" before game

    end

    def play
        @theme = Theme.find(params[:theme_category][:theme_id])
    end



end
