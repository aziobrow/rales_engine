class Transaction < ApplicationRecord
  include Randomize
  belongs_to :invoice


end
