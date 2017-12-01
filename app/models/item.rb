class Item < ApplicationRecord
  include Randomize

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope { order(:id) }

  def self.most_items_sold(quantity)
    unscoped
    .select("items.*, sum(invoice_items.quantity) AS total_item_count")
    .joins(:invoice_items)
    .group(:id)
    .order("total_item_count DESC")
    .limit(quantity)
  end

  def best_day
    day = invoices
    .select("invoices.*, sum(invoice_items.quantity) AS total_item_count")
    .joins(:invoice_items)
    .group(:id)
    .order("total_item_count DESC")
    .first
    .created_at

    {best_day: day}
  end

  def self.most_revenue_items(quantity)
    unscoped
    .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items)
    .group(:id)
    .order("total_revenue DESC")
    .limit(quantity)
  end
end
