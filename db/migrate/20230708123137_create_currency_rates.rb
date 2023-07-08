class CreateCurrencyRates < ActiveRecord::Migration[7.0]
  def change
    create_table :currency_rates do |t|

    t.references :base_currency, foreign_key: { to_table: :currencies }, null: false
    t.references :target_currency, foreign_key: { to_table: :currencies }, null: false
    t.decimal :rate, null: false
    t.timestamps
    end
    add_index :currency_rates, [:base_currency_id, :target_currency_id], unique: true
  end
end
