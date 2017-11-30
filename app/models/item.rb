class Item < ApplicationRecord
  include Randomize

  belongs_to :merchant
  has_many :invoice_items
end
