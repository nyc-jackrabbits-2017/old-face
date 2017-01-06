class FriendshipsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @receiver = User.find_by(id: params[:id].to_i)
  end

  def create
    @receiver = User.find_by(id: params[:id].to_i)
    @sender = current_user
    @friendship = Friendship.new(receiver: @receiver, sender: @sender)
    if @friendship.save
      redirect_to '/'
    else
      render action: 'new'
    end
  end
end
