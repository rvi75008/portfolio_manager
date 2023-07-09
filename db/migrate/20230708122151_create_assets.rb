class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name, null: false, index: { unique: true }
      t.float :quantity, null: false
      t.float :unit_price, null: false
      t.float :unit_purchasing_price, null: false
      t.references :currency, foreign_key: { to_table: :currencies }, null: false
      t.string :account, null: true
      t.string :type, null: false
      t.string :ticker, null: true
      t.string :sector
      t.string :sub_sector

      t.timestamps
    end
  end
end
