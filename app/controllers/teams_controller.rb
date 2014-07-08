class TeamsController < ApplicationController
  load_and_authorize_resource

  # This action show all teams
  def index
    @teams = Team.all
  end

  # This action creates an instance for new team
  def new
    @team = Team.new
  end

  # This action insert a new record in teams table
  def create
    if Team.create(team_params)
      redirect_to teams_url
    else
      render "new"
    end
  end

  # This action edit a team information
  def edit
    @team = Team.find(params[:id])
  end
  
  # This action update a team information
  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      redirect_to teams_url
    else
      render 'edit'
    end
  end

  # This action delete a record from teams table
  def destroy
    @team = Team.find(params[:id]).destroy
    redirect_to teams_url
  end

  private

  # This action permit accessible attributes
  def team_params
    params.require(:team).permit(:name, :school_id, :avatar)
  end
end
