class FollowersController < ApplicationController
  skip_after_action :verify_authorized

  def follow
    current_user.follow(User.find(params[:id]))
    redirect_to post_path
  end

  def unfollow
    current_user.stop_following(User.find(params[:id]))
    redirect_to post_path
  end
end
