class ScoresController < ApplicationController

  # This action show all scores
  def index
    @scores = Game.all
  end

  # This action creates an instance for new score
  def new
  	@score = Score.new
  end

  # This action insert a new record in scores table  
  def create
  	@score = Score.new(score_params)
    if @score.save
      redirect_to games_url
    else
      render :nothing
    end
  end

  # This action edit a score information
  def edit
    @score = Score.find(params[:id])
  end
 
  private

  # This action permit accessible attributes
  def score_params
    params.require(:score).permit(:score1, :game_id, :team1, :score2, :team2)
  end
end
