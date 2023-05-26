class CreateRemixes < ActiveRecord::Migration[7.0]
  def change
    create_table :remixes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :language

      t.timestamps
    end
  end
end
