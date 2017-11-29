class Invoice < ApplicationRecord

  def self.random_id
    (1..self.count).to_a.sample
  end

end
