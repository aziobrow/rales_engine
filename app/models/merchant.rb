class Merchant < ApplicationRecord
  include Randomize

  has_many :items
  has_many :invoices

end
