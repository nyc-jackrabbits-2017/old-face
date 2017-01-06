class FriendshipsController < ApplicationController

  # show a list of friends and pending requests
  def index 
  	@user = User.find(params[:user_id])
  	@friends = @user.friends 
  	@pending_incoming = @user.pending_incoming_requests
  	@pending_outgoing =	@user.pending_outgoing_requests
  end 

# add friend
  def new
  end 

 def create
 	# need to use current_user, but cannot login right now
 	binding.pry
 	# error: @user is nil, do not know why, but other info can be generated
 	# just @user is nill, cannnot call other method

 	@user = User.find(params[:user_id])
 	@user.friendships_2.find_by_id(params[:sender_id]).accepted = true


 	redirect_to root_url

 	# @friendship = @user.friendships.build(sender_id: params[:sender_id])
 	# @friendship = Friendship.new(receiver_id: params[:user_id], sender_id: params[:sender_id])
 	# if @friendship.save
 	# 	flash[:notice] = "Added Friend!"
 	# 	redirect_to root_url
 	# else 
 	# 	flash[:error] = "Error occurred when adding friend"
 	# 	redirect_to root_url
 	# end 

 end 





end
