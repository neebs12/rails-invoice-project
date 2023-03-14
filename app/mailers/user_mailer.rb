class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_email
    @user = params[:user]
    # see how this can be used against an actual url
    # @url = params[:url] 
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Hello! This is my test email!')
  end  
end
