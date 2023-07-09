class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :symbol

      t.timestamps
    end
    add_index :currencies, [:code, :name, :symbol], unique: true
  end
end
