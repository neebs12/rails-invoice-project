class Invoice < ApplicationRecord
  belongs_to :client
  
  # associated invoice_items are destroyed when invoice is destroyed
  has_many :invoice_items, dependent: :destroy
end
