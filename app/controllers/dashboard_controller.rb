class DashboardController < ApplicationController
  skip_after_action :verify_authorized,  only: %i[show saved]

  def show
    @posts = current_user.posts
  end

  def saved
    @saved_posts = current_user.saved_posts.includes(:post)
  end
end
