class RemoveCreationDateFromPortfolio < ActiveRecord::Migration[7.0]
  def change
    remove_column :portfolios, :creation_date, :date
  end
end
