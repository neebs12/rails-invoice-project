class InvoicesController < ApplicationController
  # both root "invoices#index" and root "articles#index" will map to this controller action
  def index
    # eager loading, essentially a join.
    @invoices = Invoice.includes(:invoice_items ,:client).all
  end
end