class Merchant < ApplicationRecord
  include Randomize

  has_many :items

end
