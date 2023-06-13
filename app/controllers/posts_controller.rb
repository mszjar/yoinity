class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :followed]
  before_action :set_post, only: %i[edit update show destroy]
  before_action :check_view_limit, only: [:show]

  def index
    @post = policy_scope(Post)

    if params[:query].present?
      @posts = Post.search(params[:query])
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(params_post)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to post_path(@post.token)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @post
    @comment = Comment.new
    @comments = @post.comments
    @remix = current_user.remixes.build(post: @post) if user_signed_in?
    @remixes = @post.remixes
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to '/dashboard/show', status: :see_other
  end

  def update
    @post.user = current_user
    @post.update(params_post)
    redirect_to post_path(@post)
  end

  def edit
  end

  def speech
    set_post
    authorize @post, :show?
    polly_client = PollyClient.new
    file_path = polly_client.synthesize_speech(@post.content)
    send_file file_path, filename: 'speech.mp3', type: 'audio/mpeg', disposition: 'inline' # inline will play the audio in the browser
  end

  def following
    authorize @following_posts, policy_class: FollowingPolicy
    @following_posts = current_user.following_by_type('User').map(&:posts).flatten
    render partial: 'posts', locals: { posts: @following_posts }
  end


  private

  def set_post
    @post = Post.find_by!(token: params[:token])
  end

  def params_post
    params.require(:post).permit(:title, :content, :url, :language, :photo)
  end

  def check_view_limit
    if user_signed_in?
      # No limit for signed-up users
    else
      # Limit for visitors
      session[:view_count] ||= 0
      session[:view_count] += 1
      if session[:view_count] > 3
        redirect_to new_user_registration_path, alert: 'You need to sign up to continue viewing posts'
      end
    end
  end

end
