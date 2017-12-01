class Merchant < ApplicationRecord
  include Randomize

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.most_items(quantity)
    ids = joins(:items)
    .group(:id)
    .order("count_id DESC")
    .count(:id)
    .keys[0...quantity.to_i]

    Merchant.find(ids)
  end

  def favorite_customer
    customers
    .select("customers.*, count(invoices.customer_id) AS customer_count")
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("customer_count DESC")
    .limit(1)
    .first

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

end
