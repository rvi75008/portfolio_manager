class AddBaseCurrencyToPortfolio < ActiveRecord::Migration[7.0]
  def change
    add_reference :portfolios, :base_currency, foreign_key: { to_table: :currencies }, null: false, default: 1
  end
end
