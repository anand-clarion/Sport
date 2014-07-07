class ScoresController < ApplicationController
  def index
    @scores = Game.all
  end

  def new
  	@score = Score.new
  end

  def create
  	@score = Score.new(score_params)
   
    if @score.save
      redirect_to games_url
    else
      render :nothing
    end
  end

  def edit
    @score = Score.find(params[:id])
  end
 
  private

  def score_params
    params.require(:score).permit(:score1, :game_id, :team1, :score2, :team2)
  end
end
