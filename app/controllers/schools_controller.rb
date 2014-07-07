class SchoolsController < ApplicationController
  # before_filter :authenticate, :except => [ :index, :show ]
  load_and_authorize_resource
  def index
    @schools = School.all
    # authorize! :read, @schools
  end

  def new
    @school = School.new
  end

  def create
    if School.create!(school_params)
      redirect_to schools_url
    else
      render "new"
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      redirect_to schools_url
    else
      render 'edit'
    end
  end

  def destroy
    @school = School.find(params[:id]).destroy
    redirect_to schools_url
  end

  private

  def school_params
    params.require(:school).permit(:name, :address, :phone_no, :avatar)
  end

  # def authenticate
    # authenticate_or_request_with_http_basic do |name, password|
      # name == "admin" && password == "secret"
    # end
  # end
end
