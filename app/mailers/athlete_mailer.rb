class AthleteMailer < ActionMailer::Base
  default from: "sport.application@gmail.com"
   def welcome_email(athlete)
    @athlete = athlete
    @url  = 'http://example.com/login'
    mail(to: @athlete.email, subject: 'Welcome to My Awesome Site')
  end
  
  def testmail
    mail(to: "shreenarayan.soman@clariontechnologies.co.in", subject: 'Welcome to My Awesome Site')
  end

end
