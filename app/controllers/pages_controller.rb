class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about web3]

  def home
    @post = policy_scope(Post)
    @posts = params[:query] ? Post.where("model LIKE '%#{params[:query]}%'") : Post.all
    # @posts = Post.last(3)
    @posts = Post.all.sample(1)
  end

  def about
    @post = policy_scope(Post)
    @posts = params[:query] ? Post.where("model LIKE '%#{params[:query]}%'") : Post.all
    # @posts = Post.last(3)
    @posts = Post.all.sample(2)
  end

  def web3
    render :web3
  end
end
