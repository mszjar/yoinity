class RemoveUniqueIndexFromRemixes < ActiveRecord::Migration[7.0]
  def change
    remove_index :remixes, [:user_id, :post_id]
  end
end
