class AddUniqueOnFirstNameLastNameToOwners < ActiveRecord::Migration[7.0]
  def change
    add_index :owners, [:first_name, :last_name], unique: true
  end
end
