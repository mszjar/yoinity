class AddExpiresAtToEphemeralRemixes < ActiveRecord::Migration[7.0]
  def change
    add_column :ephemeral_remixes, :expires_at, :datetime
  end
end
