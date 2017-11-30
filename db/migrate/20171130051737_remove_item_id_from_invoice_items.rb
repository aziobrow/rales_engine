class RemoveItemIdFromInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoice_items, :item_id, :integer
  end
end
