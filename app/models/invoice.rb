class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  
  # associated invoice_items are destroyed when invoice is destroyed
  has_many :invoice_items, dependent: :destroy

  # accepts_nested_attributes_for :invoice_items, allow_destroy: true

  # validations
  # client_id required
  validates :client_id, presence: true
end
