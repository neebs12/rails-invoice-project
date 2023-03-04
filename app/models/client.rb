class Client < ApplicationRecord
  # note plural here even if model is singular 
  # - also, associated invoices are destroyed when client is destroyed
  has_many :invoices, dependent: :destroy

  # validations
  # email required and unique (note on app-level enforcement, not db)
  validates :email, presence: true, uniqueness: true
end
