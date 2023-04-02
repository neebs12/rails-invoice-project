class InvoiceItemsController < ApplicationController
  def new
    @invoice = Invoice.includes(:invoice_items, :client).find(params[:invoice_id])
    @total = calculate_total(@invoice)
  end

  def create
    # foreign key is also assigned to the new invoice item, as required for association
    @invoice_item = InvoiceItem.new(invoice_item_params.merge(invoice_id: params[:invoice_id]))

    if @invoice_item.save
      redirect_to new_invoice_invoice_item_path(params[:invoice_id])
    else
      @invoice = Invoice.includes(:invoice_items, :client).find(params[:invoice_id])
      @total = calculate_total(@invoice)
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

  private
  def invoice_item_params
    params.require(:invoice_item).permit(:service, :quantity, :price)
  end
end
