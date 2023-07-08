class RenameColumnTypeToAssetTypeFromAsset < ActiveRecord::Migration[7.0]
  def change
    rename_column :assets, :type, :asset_type
  end
end
