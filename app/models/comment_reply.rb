class CommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :comment_reply_likes, dependent: :destroy

  validates :content, presence: true

end
