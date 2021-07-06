class User < ApplicationRecord
  has_many :user_friends, dependent: :destroy
end
