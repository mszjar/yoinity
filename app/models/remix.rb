class Remix < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one_attached :audio

  validates :user_id, uniqueness: { scope: :post_id }
end
