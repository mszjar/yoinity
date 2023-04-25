class CreatePostQualities < ActiveRecord::Migration[7.0]
  def change
    create_table :post_qualities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_index :post_qualities, [:user_id, :post_id], unique: true
  end
end
