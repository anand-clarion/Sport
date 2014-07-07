class GamesController < ApplicationController
  load_and_authorize_resource
  def index
    @games = Game.all
  end

  def new
    @schools = School.all
    @teams = Team.all
    @game = Game.new
  end

  def create
    game = game_params
    # abort game.inspect
    # time =params[:start_time_dt]
    # params[:start_time]+= " #{time}"
    # abort params.inspect
    # DateTime.new(2007,11,19,8,37,48)
    # game[:start_time] = params[:start_time]
    
    #ame.delete(:start_time_dt)
    game.delete(:school1)
    game.delete(:school2)
    # abort game.inspect
    # abort game.inspect
    if @game = Game.create(game)
      # abort @game.inspect
      redirect_to games_url
    else
      render "new" 

    end
  end

  def edit
    @game = Game.find(params[:id])
  end
  def show
    @game = Game.find(params[:id])
    @score = Score.new
  end
  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      redirect_to games_url
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id]).destroy
    redirect_to games_url
  end

  def update_teams
    @teams = Team.where(:school_id => params[:school_id]).all
    render :partial => "teams", :object => @teams
  end

   def update_teams2
    @teams2 = Team.where(:school_id => params[:school_id]).all
    render :partial => "teams2", :object => @teams2
  end

  private

  def game_params
    params.require(:game).permit(:name,:start_time, :start_time_dt, :end_time, :team1, :team2, :school1, :school2)
  end
  
end

