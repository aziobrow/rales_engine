class Invoice < ApplicationRecord
  include Randomize

  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  belongs_to :customer
  belongs_to :merchant

end
