class User < ApplicationRecord
  has_many :user_friends, dependent: :destroy
  validates :username, :email, presence: true, uniqueness: true
  validates_presence_of :password_digest, require: true
  validates_confirmation_of :password

  has_secure_password
end
