class AddReferenceToPortfolioToAsset < ActiveRecord::Migration[7.0]
  def change
    add_reference :assets, :portfolio, foreign_key: { to_table: :portfolios }, null: false
    add_index :assets, [:portfolio_id, :name], unique: true
  end
end
