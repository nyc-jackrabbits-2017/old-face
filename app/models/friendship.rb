class Friendship < ApplicationRecord
  validates_presence_of :sender, :receiver
  validates :sender, uniqueness: {scope: :receiver}
  validates :receiver, uniqueness: {scope: :sender}
  validate :cant_friend_self

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def cant_friend_self
    errors.add(:sender, "You cannot friend yourself!!") if self.sender == self.receiver
  end
end
