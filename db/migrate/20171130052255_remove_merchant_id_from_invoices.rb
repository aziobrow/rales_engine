class RemoveMerchantIdFromInvoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :merchant_id, :integer
  end
end
