class InvoiceItem < ApplicationRecord
  # an invoice gets deleted, assc. invoice_item is destroyed
  belongs_to :invoice, dependent: :destroy
end
