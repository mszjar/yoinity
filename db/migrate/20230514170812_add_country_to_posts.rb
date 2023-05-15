class AddCountryToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :country, :string
  end
end
