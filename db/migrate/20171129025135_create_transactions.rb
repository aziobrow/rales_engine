class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.string :result
      
      t.timestamps
    end
  end
end
