class AddLanguageToEphemeralRemixes < ActiveRecord::Migration[7.0]
  def change
    add_column :ephemeral_remixes, :language, :string
  end
end
