class Transaction < ApplicationRecord
  include Randomize

  def self.customer_transactions
    joins(:invoices, :customers)
    .where('customers.id = invoices.customer_id')
    .order(id: :desc)

  end

end
