class Post < ApplicationRecord
  validates_presence_of :title, :body, :poster, :receiver

  belongs_to :poster, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
