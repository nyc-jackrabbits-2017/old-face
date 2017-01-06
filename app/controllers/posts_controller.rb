class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render 'posts/index'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :receiver_id)
    end
end
