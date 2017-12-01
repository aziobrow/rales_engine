class Invoice < ApplicationRecord
  include Randomize

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  belongs_to :customer
  belongs_to :merchant

  def self.total_merchant_revenue
    select("invoices.*, sum(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .group(:id)
    .order("revenue DESC")
    .first
    .revenue
    .to_f.round(2)
  end

  def self.date_total_merchant_revenue(date)
    where(created_at: date)
    .total_merchant_revenue
  end


end
