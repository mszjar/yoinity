class CommentReplyLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment_reply

  validates :user_id, uniqueness: { scope: :comment_reply_id }
end
