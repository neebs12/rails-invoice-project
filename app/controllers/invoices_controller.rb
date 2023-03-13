class InvoicesController < ApplicationController
  before_action :authenticate_user!

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
    set_clients
    @invoice = Invoice.new
    p "render new!!!!!!!!!!"
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      # currenly redirects to the invoices page.
      # redirect_to invoice_path(@invoice)
      redirect_to new_invoice_invoice_item_path(@invoice)
    else
      set_clients
      render :new, status: :unprocessable_entity
    end

  end

  # strong parameters
  private
  def invoice_params
    # here, we essentially require the following hash format:
    # - {..., :invoice}
    params.require(:invoice).permit(:client_id)
  end

  def set_clients
    @clients = Client.all
  end
end
