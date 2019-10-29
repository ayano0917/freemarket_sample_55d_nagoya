class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname,       :string,  null: false
    add_column :users, :last_name,      :string,  null: false
    add_column :users, :first_name,     :string,  null: false
    add_column :users, :last_name_kana, :string,  null: false
    add_column :users, :first_name_kana,:string,  null: false
    add_column :users, :birth_year_id,  :integer, null: false
    add_column :users, :birth_month,    :integer, null: false
    add_column :users, :birth_day,      :integer, null: false
    add_column :users, :phone,          :string,  null: false
    add_column :users, :image,          :string
    add_column :users, :profile,        :string
    add_column :users, :sales_amount,   :integer
    add_column :users, :points,         :integer
  end
end
