class Merchant < ApplicationRecord
  include Randomize

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def revenue_serializer
    RevenueSerializer
  end

  def self.total_merchant_revenue(merchant_id)
    select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .where(id: merchant_id)
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("revenue DESC")
    .first
    .revenue
  end

  def self.date_total_merchant_revenue(merchant_id, date)
    where(["merchants.id = ? and merchants.created_at = ?", merchant_id, date])
    .select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("revenue DESC")
    .first
    .revenue
  end

  def self.most_items(quantity)
    select("merchants.*, sum(invoice_items.quantity) AS item_count")
    .joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("item_count DESC")
    .limit(quantity)
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
  end

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

end
