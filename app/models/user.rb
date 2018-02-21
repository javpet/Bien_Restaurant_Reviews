class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :reviews

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
