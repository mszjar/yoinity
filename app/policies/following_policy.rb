class FollowingPolicy < ApplicationPolicy
  def following?
    user.present?
  end
end
