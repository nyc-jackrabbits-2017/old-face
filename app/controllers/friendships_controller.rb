class FriendshipsController < ApplicationController

  # show a list of friends and pending requests
  def index 
  	@user = User.find(params[:user_id])
  	@friends = @user.friends 
  	@pending_incoming = @user.pending_incoming_requests
  	@pending_outgoing =	@user.pending_outgoing_requests
  end 


  def update
    
    @user = User.find(params[:user_id])
  	@friendship = @user.friendships_1.find_by(sender_id: params[:id])
  	# binding.pry
  	@friendship.update_attributes(accepted: true)
 

   redirect_to root_url
   #redirect to the index page
 
  end 

  def destroy
  	@user = User.find(params[:user_id])
  	@friendship = @user.friendships_1.find_by(sender_id: params[:id])
  	@friendship.destroy
  	redirect_to root_url
  	#redirect to the index page
  end 





end
