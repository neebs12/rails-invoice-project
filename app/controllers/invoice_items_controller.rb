class InvoiceItemsController < ApplicationController
  def new 
    p "render new!!!!!!!!!! - this is invoice items"
    # this receives a GET invoice/:invoice_id/invoice_items request
    # @invoice_item = InvoiceItem.new
    # for rendering the current state of the invoice
    @invoice = Invoice.includes(:invoice_items, :client).find(params[:invoice_id])
  end

  def create
    # this is a POST invoice/:invoice_id/invoice_items request
    p params
    @invoice_item = InvoiceItem.new(invoice_item_params)
    # assign the fk invoice_id to invoice_item for completion - fyi, is mutation
    @invoice_item.invoice_id = params[:invoice_id]
    if @invoice_item.save
      # redirect to the invoice page - but the one that creates new invoice items!!
      redirect_to new_invoice_invoice_item_path(params[:invoice_id])
    else
      # render the new page again
      # render :new, status: :unprocessable_entity
      p ">>> #{params}"
      p ">>> error, unable to save invoice item"
    end
  end

  private
  def invoice_item_params
    params.require(:invoice_item).permit(:service, :quantity, :price)
  end
end
