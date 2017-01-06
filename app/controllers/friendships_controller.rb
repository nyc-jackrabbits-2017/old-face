class FriendshipsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # def new
  #   @receiver = User.find_by(id: params[:id].to_i)
  # end

  def create
    @user = User.find_by(id: params[:user_id])
    @sender = current_user
    @friendship = Friendship.new(receiver: @user, sender: @sender)
    binding.pry
    if @friendship.save
      redirect_to '/'
    else
      render 'posts/index'
    end
  end

  # show a list of friends and pending requests
  # def index

  # 	@friends = current_user.friends
  # 	@pending_incoming = current_user.pending_incoming_requests
  # 	@pending_outgoing =	current_user.pending_outgoing_requests
  # end


  def update


  	@friendship = current_user.friendships_1.find_by(sender_id: params[:id])
  	# binding.pry
  	@friendship.update_attributes(accepted: true)


   redirect_to root_url
   #redirect to the index page

  end

  def destroy

  	@friendship = current_user.friendships_1.find_by(sender_id: params[:id])
  	@friendship.destroy
  	redirect_to root_url
  	#redirect to the index page
  end


end
