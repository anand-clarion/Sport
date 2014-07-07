class AthletesController < ApplicationController
	load_and_authorize_resource
	def index
		@athletes = Athlete.all
		# @athletes = Athlete.order(:name).page params[:page]
		# @athlete = Athlete.order('name').page(1).per(2)
	end
	def edit
		@athlete = Athlete.find(params[:id])
	end

  def update
    @athlete = Athlete.find(params[:id])
    if @athlete.update_attributes(athlete_params)
      redirect_to athletes_url
    else
      render 'edit'
    end
  end
  


	def show
		@athlete = Athlete.find(params[:id])
	end

	def create
		@athlete = Athlete.new(athlete_params)
		if @athlete.save
			AthleteMailer.welcome_email(@athlete).deliver
      redirect_to athletes_url
    else
      render "new"
    end
	end

	def save
		@athlete = Athlete.new(athlete_params)
		if @athlete.save
      redirect_to athletes_url
    else
      render "new"
    end
	end
	def new
		@athlete = Athlete.new
	end

	def destroy
		@athlete = Athlete.find(params[:id]).destroy
		redirect_to athletes_url
	end

	def athlete_params
     params.require(:athlete).permit(:name, :city, :state, :phone_no, :school_id, :email, :password, :password_confirmation, :avatar)
  end

end
