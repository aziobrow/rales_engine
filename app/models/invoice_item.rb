class InvoiceItem < ApplicationRecord
  include Randomize

  belongs_to :item
end
