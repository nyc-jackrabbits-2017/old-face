class FriendshipsController < ApplicationController

  # show a list of friends and pending requests
  def index 
  	
  	@friends = current_user.friends 
  	@pending_incoming = current_user.pending_incoming_requests
  	@pending_outgoing =	current_user.pending_outgoing_requests
  end 


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
