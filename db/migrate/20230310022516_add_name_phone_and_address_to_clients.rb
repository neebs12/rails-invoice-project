class AddNamePhoneAndAddressToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :name, :string
    add_column :clients, :phone, :string
    add_column :clients, :address, :string
  end
end
