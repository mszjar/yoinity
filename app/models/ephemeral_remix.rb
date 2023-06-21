class EphemeralRemix < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  has_one_attached :audio

  before_create :set_expiration
  validate :audio_size_under_limit, on: :create

  # Check if the ephemeral remix is still available
  def available?
    Time.now < expires_at
  end

  scope :available, -> { where('expires_at > ?', Time.now) }

  private

  def set_expiration
    self.expires_at = 24.hours.from_now
  end

  def audio_size_under_limit
    if audio.attached? && audio.blob.byte_size > 3.megabytes
      audio.purge
      errors.add(:audio, 'Size should be less than 5mb')
    end
  end
end
