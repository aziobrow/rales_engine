class Customer < ApplicationRecord
  include Randomize

  has_many :invoices
end
