class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_email
    # @user = params[:user]
    @email = params[:email]
    # see how this can be used against an actual url
    @url = "http://localhost:3000#{params[:url]}" 
    # @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Hello! This is my test email!')
  end  
end
