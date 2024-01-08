class PlayersController < ApplicationController
    before_action :check_admin, only: [:player_list, :edit, :update]

    def index
        @players = Player.all
    end

    def player_list
        @players = Player.all
    end

    def show
        @players = Player.all
        @player = Player.find(current_player.id)
        @matches = Match.where(player1: current_player.id).or(Match.where(player2: current_player.id))
    end

    def edit
        @player = Player.find(params[:id])
    end

    def update
        @player = Player.find(params[:id])
        if @player.update(user_req)
            flash[:success]="Profile Updated"
            redirect_to players_path
        else
            render :edit
        end
    end

    private

    def user_req
        puts params
        params.require(:player).permit(:p_wins, :s_wins, :syndicate)
    end

    def check_admin
        redirect_to root_path unless current_player.admin?
        flash[:danger] = "No Access to that"
    end
end
