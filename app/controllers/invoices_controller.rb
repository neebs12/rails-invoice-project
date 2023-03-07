class InvoicesController < ApplicationController
  # both root "invoices#index" and root "articles#index" will map to this controller action
  def index
    # eager loading, essentially a join.
    @invoices = Invoice.includes(:invoice_items ,:client).all
  end

  def show
    @invoice = Invoice.includes(:invoice_items, :client).find(params[:id])
  end

  def destroy
    # this receives a DELETE invoice?:id request
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    # then we go back to the index page
    redirect_to invoices_path
  end

  def new
    @clients = Client.all
    @invoice = Invoice.new
  end
end