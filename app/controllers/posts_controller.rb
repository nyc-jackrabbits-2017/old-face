class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    # render json: { posts: @user.posts,
    #                user: @user,
    #                friends: @user.friends,
    #                pending_incoming_friends: @user.pending_incoming_requests,
    #                pending_outgoing_friends: @user.pending_outgoing_requests
    #              }
    respond_to do |format|
      format.html
      format.json { render json: { posts: @user.posts,
                   wall_posts: @user.wall_posts,
                   user: @user,
                   friends: @user.friends,
                   pending_incoming_friends: @user.pending_incoming_requests,
                   pending_outgoing_friends: @user.pending_outgoing_requests
                 }
                }
    end
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
