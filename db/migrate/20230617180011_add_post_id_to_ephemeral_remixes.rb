class AddPostIdToEphemeralRemixes < ActiveRecord::Migration[7.0]
  def change
    add_column :ephemeral_remixes, :post_id, :integer
  end
end
