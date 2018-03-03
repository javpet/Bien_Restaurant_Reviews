class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :reviews
  has_many :bookmarks

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  def to_param
       username
  end
end
