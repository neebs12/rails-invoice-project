class AddForeignKeyToClientsAndInvoices < ActiveRecord::Migration[7.0]
  def change
    # user_id column added in clients entity
    add_column :clients, :user_id, :integer
    # foreign key added to clients entity w/ user_id column
    add_foreign_key :clients, :users #, on_delete: :cascade

    # column added in invoices entity
    add_column :invoices, :user_id, :integer
    # foreign key added to invoices entity w/ user_id column
    add_foreign_key :invoices, :users #, on_delete: :cascade

    # NOTE: commented out cascade deletion to simplify db schema
  end
end
