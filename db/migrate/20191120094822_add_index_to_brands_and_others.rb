class AddIndexToBrandsAndOthers < ActiveRecord::Migration[5.0]
  def change
    change_column :brands, :name, :string, index: true, null: true, unique: false
  end
end
