class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, foreign_key: "poster_id", class_name: "Post"
  has_many :wall_posts, foreign_key: "receiver_id", class_name: "Post"

  has_many :friendships_1, foreign_key: "receiver_id", class_name: "Friendship"
  has_many :friendships_2, foreign_key: "sender_id", class_name: "Friendship"

  has_many :senders, foreign_key:"sender_id", through: :friendships_1 do
    def accepted
      where("friendships.accepted = ?", "true")
    end
    def pending
      where("friendships.accepted = ?", "false")
    end
  end

  has_many :receivers, foreign_key:"receiver_id", through: :friendships_2 do
    def accepted
      where("friendships.accepted = ?", "true")
    end
    def pending
      where("friendships.accepted = ?", "false")
    end
  end


  def friends
    self.senders.accepted + self.receivers.accepted
  end

  def pending_incoming_requests
    self.senders.pending
  end

  def pending_outgoing_requests
    self.receivers.pending
  end

  def self.search(string)
    return all if string.empty?
    query = "%#{string}%"
    where("username LIKE ?", query)
  end
end
