class UserMailer < ApplicationMailer
  def send_email
    @email = params[:email]
    @invoice_id = params[:invoice_id]
    mail(to: @email, subject: 'Hello! from the Rails APP!')
  end
end
