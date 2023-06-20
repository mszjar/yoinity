class Remix < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  has_one :origin_post, class_name: "Post", foreign_key: "remix_id", dependent: :nullify

  has_one_attached :audio

  validate :remixes_limit, :audio_size_under_limit, on: :create

  private

  def remixes_limit
    if self.post && self.post.remixes.count >= 1
      errors.add(:base, 'A post can have 1 remix only')
    end
  end

  def audio_size_under_limit
    if audio.attached? && audio.blob.byte_size > 2.megabytes
      audio.purge
      errors.add(:audio, 'Size should be less than 20MB')
    end
  end
end
