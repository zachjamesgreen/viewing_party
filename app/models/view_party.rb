class ViewParty < ApplicationRecord
  has_many :view_party_users, dependent: :destroy
end
