require "csv"

namespace :import do
  desc 'All'
  task all: [:import_merchants, :import_customers, :import_items, :import_invoices, :import_transactions, :import_invoice_items]


  desc "Import Merchant data into an ActiveRecord tables"
  task :import_merchants => :environment do
    CSV.foreach('db/csv/merchants.csv', :headers => true, header_converters: :symbol) do |row|
      puts "merchant seeded"
      Merchant.create!(row.to_hash)
    end
  end

  desc "Import Customer data into an ActiveRecord tables"
  task :import_customers => :environment do
    CSV.foreach('db/csv/customers.csv', :headers => true, header_converters: :symbol) do |row|
      puts "customer seeded"
      Customer.create!(row.to_hash)
    end
  end

  desc "Import Invoice data into an ActiveRecord tables"
  task :import_invoices => :environment do
    CSV.foreach('db/csv/invoices.csv', :headers => true, header_converters: :symbol) do |row|
      Invoice.create!(customer: Customer.find(row[:customer_id]),
      merchant: Merchant.find(row[:merchant_id]),
      status: row[:status],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
    )
    end
  end

  desc "Import Item data into an ActiveRecord tables"
  task :import_items => :environment do
    count = 0
    CSV.foreach('db/csv/items.csv', :headers => true, header_converters: :symbol) do |row|
      Item.create!(merchant: Merchant.find(row[:merchant_id]),
      name: row[:name],
      description: row[:description],
      unit_price: row[:unit_price],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
      )
    end
  end

  desc "Import Invoice Items data into an ActiveRecord tables"
  task :import_invoice_items => :environment do
    CSV.foreach('db/csv/invoice_items.csv', :headers => true, header_converters: :symbol) do |row|
      InvoiceItem.create!(item: Item.find(row[:item_id]),
      invoice: Invoice.find(row[:invoice_id]),
      quantity: row[:quantity],
      unit_price: row[:unit_price],
      created_at: row[:created_at],
      updated_at: row[:updated_at]
      )
    end
  end

  desc "Import Transaction data into an ActiveRecord tables"
  task :import_transactions => :environment do
    CSV.foreach('db/csv/transactions.csv', :headers => true, header_converters: :symbol) do |row|
      Transaction.create!(invoice: Invoice.find(row[:invoice_id]),
        result: row[:result],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      )
    end
  end

end
