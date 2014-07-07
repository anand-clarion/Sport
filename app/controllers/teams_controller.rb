class TeamsController < ApplicationController
  load_and_authorize_resource
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    if Team.create(team_params)
      redirect_to teams_url
    else
      render "new"
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      redirect_to teams_url
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id]).destroy
    redirect_to teams_url
  end

  private

  def team_params
    params.require(:team).permit(:name, :school_id, :avatar)
  end
end
