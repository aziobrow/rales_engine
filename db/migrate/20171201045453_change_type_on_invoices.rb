class ChangeTypeOnInvoices < ActiveRecord::Migration[5.1]
  def change
    change_column :invoices, :status, :citext
  end
end
