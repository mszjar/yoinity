class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @post = policy_scope(Post)
    @posts = params[:query] ? Post.where("model LIKE '%#{params[:query]}%'") : Post.all
    # @posts = Post.last(3)
    @posts = Post.all.sample(1)
  end
end
