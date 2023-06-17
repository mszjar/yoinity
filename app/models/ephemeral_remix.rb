class EphemeralRemix < ApplicationRecord
  belongs_to :user
  has_one_attached :audio

  before_create :set_expiration

  # Check if the ephemeral remix is still available
  def available?
    Time.now < expires_at
  end

  scope :available, -> { where('expires_at > ?', Time.now) }

  private

  def set_expiration
    self.expires_at = 1.minute.from_now
  end
end
