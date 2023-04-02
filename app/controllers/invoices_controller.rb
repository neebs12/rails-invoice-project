class InvoicesController < ApplicationController
  # both root "invoices#index" and root "articles#index" will map to this controller action
  def index
    # eager loading, essentially a join.
    # @invoices = Invoice.includes(:invoice_items ,:client).all
    @invoices = Invoice.includes(:invoice_items ,:client).where(user: current_user)

    # total calculation, done via accompanying total value. Mapped to the invoice object.
    @totals = {}
    @invoices.each do |invoice|
      @totals[invoice] = calculate_total(invoice)
    end
  end

  def show
    @invoice = Invoice.includes(:invoice_items, :client).find(params[:id])
    @total = calculate_total(@invoice)
  end

  def send_email
    UserMailer.with(mailer_params).send_email.deliver_later
    redirect_to root_path
  end

  def new
    @clients = Client.where(user: current_user)
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params.merge(user_id: current_user.id))
    if @invoice.save
      redirect_to root_path
    else
      @clients = Client.where(user: current_user)
      render :new, static: :unprocessable_entity
    end
  end

  private
  def calculate_total(invoice)
    total = 0
    invoice.invoice_items.each do |item|
      quantity = item.quantity
      price = item.price
      total += (quantity * price)
    end
    total
  end

  def mailer_params
    params.require(:mailer).permit(:email, :invoice_id)
  end

  def invoice_params
    params.require(:invoice).permit(:client_id)
  end
end
