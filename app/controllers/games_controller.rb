class GamesController < ApplicationController
  load_and_authorize_resource

  # This action show all games
  def index
    @games = Game.all
  end

  # This action creates an instance for new game
  def new
    @schools = School.all
    @teams = Team.all
    @game = Game.new
  end

  # The action insert a new record in games table
  def create
    game = game_params
    game.delete(:school1)
    game.delete(:school2)
    if @game = Game.create(game)
      flash[:notice] = "Game successfully created"
      redirect_to games_url
    else
      render "new" 
    end
  end

  # This action show a game information
  def show
    @game = Game.find(params[:id])
    @score = Score.new
  end

  # This action edit a game information
  def edit
    @game = Game.find(params[:id])
  end

  # This action update a game information
  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      flash[:notice] = "Game successfully updated"
      redirect_to games_url
    else
      render 'edit'
    end
  end

  # This action delete a record from games table
  def destroy
    @game = Game.find(params[:id]).destroy
    flash[:alert] =" games successfully deleted"
    redirect_to games_url
  end

  # This action updates teams within school selection from drop down list
  def update_teams
    @teams = Team.where(:school_id => params[:school_id]).all
    render :partial => "teams", :object => @teams
  end

  # This action updates teams within school selection from drop down list
  def update_teams2
    @teams2 = Team.where(:school_id => params[:school_id]).all
    render :partial => "teams2", :object => @teams2
  end

  private

  # This action permit accessible attributes
  def game_params
    params.require(:game).permit(:name,:start_time, :start_time_dt, :end_time, :team1, :team2, :school1, :school2)
  end
  
end

