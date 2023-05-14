class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_replies, dependent: :destroy

  validates :content, presence: true
end
