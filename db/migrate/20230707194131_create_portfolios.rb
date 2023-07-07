class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.string :name, null: false
      t.string :description
      t.datetime :creation_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
