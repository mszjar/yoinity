class CreateEphemeralRemixes < ActiveRecord::Migration[7.0]
  def change
    create_table :ephemeral_remixes do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
