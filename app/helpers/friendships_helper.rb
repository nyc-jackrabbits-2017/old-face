module FriendshipsHelper
  def friend?(user)
    x = current_user.friends.index(user)
  end

  def own_list?(user)
    current_user == user
  end

end
