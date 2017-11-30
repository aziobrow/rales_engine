class Merchant < ApplicationRecord
  include Randomize

  has_many :items
  has_many :invoices

  def self.most_items(quantity)
    ids = joins(:items)
    .group(:id)
    .order("count_id DESC")
    .count(:id)
    .keys[0...quantity.to_i]

    Merchant.find(ids)
  end


end
