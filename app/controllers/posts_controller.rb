class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.pry
    @post = current_user.posts.create(post_params)
    # binding.pry
    puts current_user
    redirect_to posts_url
  end

  def index
    @post = current_user.posts.create
    @posts = Post.all.reverse
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end
end
