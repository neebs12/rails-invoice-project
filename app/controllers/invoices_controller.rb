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
end
