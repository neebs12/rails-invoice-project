class InvoicesController < ApplicationController
  # both root "invoices#index" and root "articles#index" will map to this controller action
  def index
    # eager loading, essentially a join.
    @invoices = Invoice.includes(:invoice_items ,:client).all
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
    client_email = params[:client_email]
    invoice_id = params[:invoice_id]
    UserMailer.with(email: client_email, invoice_id: invoice_id).send_email.deliver_later
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
end