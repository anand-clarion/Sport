class SchoolsController < ApplicationController
  
  # This action show all schools
  def index
    @schools = School.all
    flash.keep
    # authorize! :read, @schools
  end
  
  # This action creates an instance for new school
  def new
    @school = School.new
    teams = @school.teams.build
  end

  # This action insert a new record in schools table 
  def create
    @school = School.new(school_params)
    if @school.save
      # flash.now[:error] = "Could not save client"
      flash[:notice] = "School successfully created"
      redirect_to schools_url
    else
      render "new"
    end
  end
  # This action show a school information
  def show
    @school = School.find(params[:id])
  end

  # This action edit a school information
  def edit
    @school = School.find(params[:id])
  end

  # This action update a school information
  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      flash[:notice]="School successfully updated"
      redirect_to schools_url
    else
      render 'edit'
    end
  end

  # This action delete a record from schools table
  def destroy
    @school = School.find(params[:id]).destroy
    flash[:notice] = "School successfully deleted"
    redirect_to schools_url
  end

  def search
    @school = School.search(params[:search])
    # abort @school.inspect
  end

  private
 
  # This action permit accessible attributes
  def school_params
    params.require(:school).permit(:name, :address, :phone_no, :avatar,teams_attributes: [:name])
  end

end
