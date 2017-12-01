class Transaction < ApplicationRecord
  include Randomize

  belongs_to :invoice

  scope :successful, -> {where(result: "success")}
end
