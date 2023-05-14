class AddContentToCommentReplies < ActiveRecord::Migration[7.0]
  def change
    add_column :comment_replies, :content, :string
  end
end
