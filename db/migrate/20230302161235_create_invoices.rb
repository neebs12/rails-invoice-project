class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :client, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
