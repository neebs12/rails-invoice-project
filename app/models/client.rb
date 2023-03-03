class Client < ApplicationRecord
  # note plural here even if model is singular 
  has_many :invoices
end
