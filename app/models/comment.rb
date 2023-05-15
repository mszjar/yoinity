class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_replies, dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  has_many :comment_dislikes, dependent: :destroy

  validates :content, presence: true
end
