class OmniauthCallbacksController < Devise::OmniauthCallbacksController 
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @athlete = Athlete.find_for_google_oauth2(request.env["omniauth.auth"], current_athlete)
    # render :text => @athlete.to_yaml and return false
    if @athlete.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @athlete, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_athlete_registration_url
    end
  end
end
