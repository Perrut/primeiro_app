class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { in: 2..140 }
end
