class AddTokenToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :token, :string
  end
end
