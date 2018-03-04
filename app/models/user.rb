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

  def gravatar_image
    encrypted_email = Digest::MD5.hexdigest(self.email.downcase)
    "https://www.gravatar.com/avatar/#{encrypted_email}.jpg?s=400"
  end
end
