class InvoiceItem < ApplicationRecord
  include Randomize

  belongs_to :item
  belongs_to :invoice
end
