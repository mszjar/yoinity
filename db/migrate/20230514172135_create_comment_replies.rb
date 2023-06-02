class CreateCommentReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_replies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
