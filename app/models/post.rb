class Post < ApplicationRecord
  validates_presence_of :title, :body, :poster, :receiver

  belongs_to :poster
  belongs_to :receiver
end
