class AthleteMailer < ActionMailer::Base
  default from: "sport.application@gmail.com"
  #This action send email to new athlete
  def welcome_email(athlete)
    @athlete = athlete
    @url  = 'http://example.com/login'
    mail(to: @athlete.email, subject: 'Welcome to My Awesome Site')
  end
  
  #This action only for testing purpose
  def testmail
    mail(to: "shreenarayan.soman@clariontechnologies.co.in", subject: 'Welcome to My Awesome Site')
  end

  #This action send email to athlete after athlete account activation
  def account_activated(athlete)
    @athlete = athlete
    mail(to: @athlete.email, subject: 'Congrat your account has been activated')
  end

  #This action send email to athlete after athlete account deactivation
  def account_deactivated(athlete)
    @athlete = athlete
    mail(to: @athlete.email, subject: 'Your account has been De-activated')
  end
end
