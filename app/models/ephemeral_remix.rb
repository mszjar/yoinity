class EphemeralRemix < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  has_one_attached :audio

  before_create :set_expiration

  # Check if the ephemeral remix is still available
  def available?
    Time.now < expires_at
  end

  scope :available, -> { where('expires_at > ?', Time.now) }

  private

  def set_expiration
    self.expires_at = 24.hours.from_now
  end
end
