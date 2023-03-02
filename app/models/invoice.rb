class Invoice < ApplicationRecord
  # a client gets deleted, assc. record is destroyed
  belongs_to :client, dependent: :destroy

  has_many :invoice_items
end
