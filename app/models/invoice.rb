class Invoice < ApplicationRecord
  include Randomize

  has_many :invoice_items
end
