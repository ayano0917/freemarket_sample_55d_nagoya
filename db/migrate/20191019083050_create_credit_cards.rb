class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.references :user, null: false, foreign_key:true
    end
  end
end
