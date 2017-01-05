class Friendship < ApplicationRecord
  validates_presence_of :sender, :receiver
  validates :sender, uniqueness: {scope: :receiver}
  validates :receiver, uniqueness: {scope: :sender}
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
