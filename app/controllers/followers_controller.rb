class FollowersController < ApplicationController
  skip_after_action :verify_authorized

  def follow
    current_user.follow(User.find(params[:id]))
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.path }
    end
  end

  def unfollow
    current_user.stop_following(User.find(params[:id]))
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.path }
    end
  end

  def suggested
    @users = User.suggested_users(current_user)
  end

end
