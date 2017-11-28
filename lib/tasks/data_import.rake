require "csv"

namespace :import do
  desc 'All'
  task all: [:import_merchants, :import_items, :import_invoices, :import_customers, :import_transactions, :import_invoice_items]

  desc "Import data into an ActiveRecord tables"

  task :import_merchants => :environment do
    CSV.foreach('db/csv/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  task :import_customers => :environment do
    CSV.foreach('db/csv/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
  end

  task :import_invoices => :environment do
    CSV.foreach('db/csv/invoices.csv', :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  task :import_invoice_items => :environment do
    CSV.foreach('db/csv/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end

  task :import_items => :environment do
    CSV.foreach('db/csv/items.csv', :headers => true) do |row|
      Item.create!(row.to_hash)
    end
  end

  task :import_transactions => :environment do
    CSV.foreach('db/csv/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
  end
end
