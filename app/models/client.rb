class Client < ApplicationRecord
  belongs_to :user

  # note plural here even if model is singular
  # - also, associated invoices are destroyed when client is destroyed
  has_many :invoices, dependent: :destroy
end
