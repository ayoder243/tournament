class MatchesController < ApplicationController
    before_action :check_admin

    def index
        @matches = Match.all
    end

    def edit
        @match = Match.find(params[:id])
    end

    def update
        @match = Match.find(params[:id])
        @player1 = Player.find(@match.player1)
        @player2 = Player.find(@match.player2)
        if @match.update(match_req)
            flash[:success]="Match Updated"
            redirect_to matches_path
        else
            render :edit
        end

        player1_new_score = @player1.p_wins + @match.player1_score
        player2_new_score = @player2.p_wins + @match.player2_score
        if @match.player1_score > @match.player2_score
            round_win = @player1.s_wins + 1
            @player1.update(s_wins: round_win)
            @player1.update!(p_wins: player1_new_score.to_i)
            @player2.update(p_wins: player2_new_score.to_i)
        else
            round_win = @player2.s_wins + 1
            @player2.update(s_wins: round_win)
            @player2.update!(p_wins: player2_new_score.to_i)
            @player1.update(p_wins: player1_new_score.to_i)
        end
    end

    def matches_list
        @matches = Match.all
    end

    def new
        @match = Match.new
    end

    def create
        @match = Match.new(match_req)

        if @match.save
            redirect_to matches_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def match_req
        params.require(:match).permit(:player1, :player2, :player1_score, :player2_score)
    end

    def check_admin
        redirect_to root_path unless current_player.admin?
        flash[:danger] = "No Access to that"
    end
end
