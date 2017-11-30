class RemoveCustomerIdFromInvoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :customer_id, :integer
  end
end
