class ChangeTypeOnMerchants < ActiveRecord::Migration[5.1]
  def change
    change_column :merchants, :name, :citext
  end
end
