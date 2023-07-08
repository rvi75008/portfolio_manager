class RemoveBaseCurrencyReferenceFromPortfolio < ActiveRecord::Migration[7.0]
  def change
    add_reference :portfolios, :currency, null: false, foreign_key: true
  end
end
