class CreateCommentReplyLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_reply_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment_reply, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comment_reply_likes, [:user_id, :comment_reply_id], unique: true
  end
end
