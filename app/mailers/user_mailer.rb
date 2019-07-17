class UserMailer < ApplicationMailer
  default from: 'muhammadsaad7891@gmail.com'
  def welcome_email
    @user = params[:user]
    @url = '0.0.0.0:3000'
    mail(to: 'f168318@nu.edu.pk', subject: 'Welcome To Our Site')
  end
end
