class ChangeColumnToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :brand, :string
    add_column  :items, :brand_id, :integer, index: true, foreign_key: true
    change_column :items, :size_id, :integer, foreign_key: true
  end
end
