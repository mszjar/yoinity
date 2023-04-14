class DashboardController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @posts = current_user.posts
  end
end
