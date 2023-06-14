class CreatePotentialUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :potential_users do |t|
      t.string :email, null: false

      t.timestamps
    end
    add_index :potential_users, :email, unique: true
  end
end
