class AddRemixToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :remix, foreign_key: true
  end
end
