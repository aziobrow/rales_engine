class Customer < ApplicationRecord
  include Randomize
  has_many :invoices
  has_many :transactions, through: :invoices
end
