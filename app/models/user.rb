class User < ApplicationRecord
  has_many :user_friends, dependent: :destroy
  has_many :friends, through: :user_friends
  has_many :view_parties, dependent: :destroy
  validates :username, :email, presence: true, uniqueness: true
  validates :password_digest, presence: { require: true }
  validates :password, confirmation: true

  has_secure_password
end
