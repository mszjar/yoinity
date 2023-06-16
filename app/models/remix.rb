class Remix < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  has_one :origin_post, class_name: "Post", foreign_key: "remix_id", dependent: :nullify

  has_one_attached :audio

  validate :remixes_limit, on: :create

  private

  def remixes_limit
    if self.post && self.post.remixes.count >= 3
      errors.add(:base, 'A post can have 3 remixes maximum')
    end
  end
end
