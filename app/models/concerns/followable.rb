module Followable
  extend ActiveSupport::Concern

  included do
    has_many :following_relationships,
             as: :follower, class_name: "Follow", dependent: :destroy

    has_many :follower_relationships,
             as: :followable, class_name: "Follow", dependent: :destroy
  end

  # --- following (people I follow) ---

  def follow(followable)
    return false if self == followable

    Follow.find_or_create_by(
      follower_id:     id,
      follower_type:   self.class.name,
      followable_id:   followable.id,
      followable_type: followable.class.name
    )
  end

  def stop_following(followable)
    following_relationships.where(
      followable_id:   followable.id,
      followable_type: followable.class.name
    ).destroy_all
  end

  def following?(followable)
    following_relationships.unblocked.exists?(
      followable_id:   followable.id,
      followable_type: followable.class.name
    )
  end

  def all_following
    ids = following_relationships.unblocked
            .where(followable_type: "User").pluck(:followable_id)
    User.where(id: ids)
  end

  def follow_count
    following_relationships.unblocked.count
  end

  # --- followers (people who follow me) ---

  def followers_by_type(type)
    ids = follower_relationships.unblocked
            .where(follower_type: type).pluck(:follower_id)
    type.constantize.where(id: ids)
  end

  def followers_count
    follower_relationships.unblocked.count
  end

  def followed_by?(follower)
    follower_relationships.unblocked.exists?(
      follower_id:   follower.id,
      follower_type: follower.class.name
    )
  end
end
