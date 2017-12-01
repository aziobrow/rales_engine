class Item < ApplicationRecord
  include Randomize

  belongs_to :merchant
  has_many :invoice_items

  def self.most_items_sold(quantity)
    select("items.*, sum(invoice_items.quantity) AS total_item_count")
    .joins(:invoice_items)
    .group(:id)
    .order("total_item_count DESC")
    .limit(quantity)
  end
end
