class AddInvoiceToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :invoice, foreign_key: true
  end
end
