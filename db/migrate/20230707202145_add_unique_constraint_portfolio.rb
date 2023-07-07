class AddUniqueConstraintPortfolio < ActiveRecord::Migration[7.0]
  def change
    add_index :portfolios, [:name, :owner_id], unique: true
  end
end
