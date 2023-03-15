class InvoicePrivateViewController < ApplicationController
  def private_show
    # but this is dependent on the params[:id] being passed in
    # ie: what we are going to have is a url like this:
    # http://localhost:3000/invoices_private/:id in the routes.rb file
    # http://localhost:3000/invoices_private/1
    @invoice = Invoice.includes(:invoice_items, :client).find(params[:id])
    # then we will be able to render a form, possibly `render` then just call on an existing view?
    render 'invoices/show'
  end

  # likely to be a POST request
  def send_by_client_email
    #  from the turbo button_to thing
    email = params[:email]
    url = params[:url]

    UserMailer.with(email: email, url: url).send_email.deliver_later

    # redirect to the index page
    redirect_to invoices_path
  end

end
