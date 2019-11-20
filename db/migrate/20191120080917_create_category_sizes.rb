class CreateCategorySizes < ActiveRecord::Migration[5.0]
  def change
    create_table :category_sizes do |t|

      t.timestamps
    end
  end
end
