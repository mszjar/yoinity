class AddLanguageToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :language, :string
  end
end
