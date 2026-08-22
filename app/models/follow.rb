class Follow < ApplicationRecord
  belongs_to :followable, polymorphic: true
  belongs_to :follower,   polymorphic: true

  validates :followable_id, uniqueness: {
    scope: [:followable_type, :follower_id, :follower_type],
    message: "is already followed"
  }

  scope :unblocked, -> { where(blocked: false) }

  def block!
    update(blocked: true)
  end
end
