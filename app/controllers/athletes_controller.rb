class AthletesController < ApplicationController
  load_and_authorize_resource
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  # after_filter :set_athlete, :only => :show
  # def set_athlete
    # abort cookies[current_athlete.id].include?(@athlete).inspect
    # cookies[current_athlete.id] << @athlete.id 
    # abort cookies[current_athlete.id].inspect
  # end

  # This action show all athletes
  def index
    # debugger
    @athletes = Athlete.all
    # @a = Athlete.scope_with_argument(@a.id)
  end

  # This action creates an instance for new athlete
  def new
    @athlete = Athlete.new
  end

  # This action insert a new record in athletes table
  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      AthleteMailer.welcome_email(@athlete).deliver
      flash[:notice] = "Athlete successfully created"
      redirect_to athletes_url
    else
      render "new"
    end
  end

  # This action edit an athlete information
  def edit
    @athlete = Athlete.find(params[:id])
  end
  
  # This action update an athlete information
  def update
    @athlete = Athlete.find(params[:id])
    if @athlete.update_attributes(athlete_params)
      flash[:notice] = "Athlete successfully updated"
      redirect_to athletes_url
    else
      render 'edit'
    end
  end
  
  # This action show an athlete information
  def show
    (session[:current_athlete] ||= [])
    @athlete = Athlete.find(params[:id])
    if session[:current_athlete].include?(@athlete.id)
      flash[:notice] = "You have visited this user before"
    else
      session[:current_athlete].push(@athlete.id) || Array.new
    end
    @commentable = @athlete
    @comment = @athlete.comments.new
    logger.debug "Extra information by me"
  end

  # This action create a new athlete if admin add a new athlete 
  def save
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      flash[:notice] = "Athlete successfully created"
      redirect_to athletes_url
    else
      render "new"
    end
  end

  # This action delete a record from athletes table
  def destroy
    @athlete = Athlete.find(params[:id]).destroy
    flash[:notice] = "Athlete successfully deleted"
    redirect_to athletes_url
  end

  # This action permit accessible attributes
  def athlete_params
    params.require(:athlete).permit(:name, :city, :team_id, :state, :phone_no, :school_id, :email, :password, :password_confirmation, :avatar)
  end

   def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end


  private
  def record_not_found
    flash[:notice] = "This record is not avialable"
    redirect_to athletes_url
  end

end
