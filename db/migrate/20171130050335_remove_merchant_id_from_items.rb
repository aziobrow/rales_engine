class RemoveMerchantIdFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :merchant_id, :integer
  end
end
