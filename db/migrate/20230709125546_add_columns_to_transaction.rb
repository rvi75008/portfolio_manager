class AddColumnsToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :transaction_date, :date
    add_column :transactions, :direction, :string
    add_reference :transactions, :asset, null: false, foreign_key: true
    add_column :transactions, :quantity, :decimal
    add_column :transactions, :transaction_type, :string
    add_column :transactions, :unit_price, :decimal
  end
end
