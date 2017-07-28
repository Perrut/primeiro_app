class User < ApplicationRecord

  has_secure_password

  has_many :posts

  validates :name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, length: { in: 10..100 }, uniqueness: true
  validates :password, presence: true, length: { in: 3..6 }, allow_nil: true
end
