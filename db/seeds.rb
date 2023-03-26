# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# erase all clients (deletetion should cascade to invoices and invoice_items)
Client.destroy_all

# Create some clients
client1 = Client.create(email: 'beher80339@kaudat.com', name: 'Forman L. Smith', phone: '555-555-5555', address: '123 Main St.')
client2 = Client.create(email: 'bar@gmail.com', name: 'Bar L. Low', phone: '666-666-6665', address: '430 Omapere Boulevard.')
client3 = Client.create(email: 'baz@ymail.com', name: 'Baz McKensy', phone: '777-777-7775', address: '700 Besttest Av.')

# Create some invoices for client1
invoice1 = Invoice.create(client: client1)
invoice2 = Invoice.create(client: client1)

# Create some invoice item(s) for invoice1
InvoiceItem.create(invoice: invoice1, service: 'Consulting-foo', quantity: 7, price: 100.0)
InvoiceItem.create(invoice: invoice1, service: 'Training-foo', quantity: 1, price: 150.0)

# Create some invoice item(s) for invoice2
InvoiceItem.create(invoice: invoice2, service: 'Development-foo', quantity: 5, price: 200.0)

# Create some invoices for client2
invoice3 = Invoice.create(client: client2)
invoice4 = Invoice.create(client: client2)
invoice5 = Invoice.create(client: client2)

# Create some invoice items for invoice3
InvoiceItem.create(invoice: invoice3, service: 'Design', quantity: 8, price: 500.0)
InvoiceItem.create(invoice: invoice3, service: 'Development', quantity: 10, price: 200.0)

# Create some invoice items for invoice4
InvoiceItem.create(invoice: invoice4, service: 'Testing', quantity: 6, price: 100.0)
InvoiceItem.create(invoice: invoice4, service: 'Deployment', quantity: 1, price: 500.0)

# Create some invoice items for invoice5
InvoiceItem.create(invoice: invoice5, service: 'Terraform', quantity: 2, price: 400.51)
InvoiceItem.create(invoice: invoice5, service: 'CDKtf', quantity: 7, price: 900.11)
InvoiceItem.create(invoice: invoice5, service: 'Actions_Yumml', quantity: 1, price: 1000.01)

# Create some invoices for client3
invoice6 = Invoice.create(client: client3)

# Create some invoice items for invoice6
InvoiceItem.create(invoice: invoice6, service: 'Consulting', quantity: 1, price: 1000.0)
InvoiceItem.create(invoice: invoice6, service: 'Training', quantity: 99, price: 1500.0)
InvoiceItem.create(invoice: invoice6, service: 'Development', quantity: 10, price: 2000.0)
InvoiceItem.create(invoice: invoice6, service: 'Design', quantity: 4, price: 5000.0)
InvoiceItem.create(invoice: invoice6, service: 'Testing', quantity: 2, price: 1000.0)
InvoiceItem.create(invoice: invoice6, service: 'Deployment', quantity: 1, price: 5000.0)
InvoiceItem.create(invoice: invoice6, service: 'Terraform', quantity: 20, price: 4005.1)
InvoiceItem.create(invoice: invoice6, service: 'CDKtf', quantity: 12, price: 9001.1)
InvoiceItem.create(invoice: invoice6, service: 'Actions_Yumml', quantity: 40, price: 10001.1)
