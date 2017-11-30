require "csv"

namespace :import do
  desc 'All'
  task all: [:import_merchants, :import_items, :import_invoices, :import_customers, :import_transactions, :import_invoice_items]


  desc "Import Merchant data into an ActiveRecord tables"
  task :import_merchants => :environment do
    CSV.foreach('db/csv/merchants.csv', :headers => true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  desc "Import Customer data into an ActiveRecord tables"
  task :import_customers => :environment do
    CSV.foreach('db/csv/customers.csv', :headers => true, header_converters: :symbol) do |row|
      Customer.create!(row.to_hash)
    end
  end

  desc "Import Invoice data into an ActiveRecord tables"
  task :import_invoices => :environment do
    CSV.foreach('db/csv/invoices.csv', :headers => true, header_converters: :symbol) do |row|
      Invoice.create!(customer_id: Customer.find(row[:customer_id]),
      merchant_id: Merchant.find(row[:merchant_id]),
      status: row[:status]
    )
    end
  end

  desc "Import Item data into an ActiveRecord tables"
  task :import_items => :environment do
    CSV.foreach('db/csv/items.csv', :headers => true, header_converters: :symbol) do |row|
      Item.create!(merchant_id: Merchant.find(row[:merchant_id]),
      name: row[:name],
      description: row[:description],
      unit_price: row[:unit_price]
      )
    end
  end

  desc "Import Invoice Items data into an ActiveRecord tables"
  task :import_invoice_items => :environment do
    CSV.foreach('db/csv/invoice_items.csv', :headers => true, header_converters: :symbol) do |row|
      InvoiceItem.create!(item_id: Item.find(row[:item_id]),
      invoice_id: Invoice.find(row[:invoice_id]),
      quantity: row[:quantity],
      unit_price: row[:unit_price]
      )
    end
  end

  desc "Import Transaction data into an ActiveRecord tables"
  task :import_transactions => :environment do
    CSV.foreach('db/csv/transactions.csv', :headers => true, header_converters: :symbol) do |row|
      # byebug
      Transaction.create!(invoice_id: Invoice.find(row[:invoice_id]),
        result: row[:result],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
    end
  end

end
