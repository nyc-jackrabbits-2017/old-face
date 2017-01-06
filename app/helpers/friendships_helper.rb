module FriendshipsHelper
  def invitable?(user)
    current_user.friends.index(user) == nil && current_user != user
  end

  def own_list?(user)
    current_user == user
  end

end
