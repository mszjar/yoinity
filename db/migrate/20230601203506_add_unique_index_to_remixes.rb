class AddUniqueIndexToRemixes < ActiveRecord::Migration[7.0]
  def change
    add_index :remixes, [:user_id, :post_id], unique: true
  end
end
