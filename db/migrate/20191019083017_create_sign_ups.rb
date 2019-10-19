class CreateSignUps < ActiveRecord::Migration[5.0]
  def change
    create_table :sign_ups do |t|

      t.timestamps
    end
  end
end
