class RemoveBaseCurrencyIdFromPortfolio < ActiveRecord::Migration[7.0]
  def change
    remove_column :portfolios, :base_currency_id, :integer
  end
end
