class ChangeTypeOnTransactions < ActiveRecord::Migration[5.1]
  def change
    change_column :transactions, :result, :citext
  end
end
