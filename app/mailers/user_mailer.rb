class UserMailer < ApplicationMailer

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenue dans la communauté PosiLink !')
  end
end
