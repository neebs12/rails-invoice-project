class InvoiceItem < ApplicationRecord
  belongs_to :invoice

  validates :service, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
end
