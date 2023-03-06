class InvoiceItemsController < ApplicationController
  def new 
    p "render new!!!!!!!!!! - this is invoice items"
    # this receives a GET invoice/:invoice_id/invoice_items request
    # @invoice_item = InvoiceItem.new
    # for rendering the current state of the invoice
    @invoice = Invoice.includes(:invoice_items, :client).find(params[:invoice_id])
  end

  def create
  end
  private
  def invoice_item_params
    params.require(:invoice_item).permit(:service, :quantity, :price)
  end
end
