class ViewPartyUser < ApplicationRecord
  belongs_to :view_party
  belongs_to :user

  def self.users
    User.find pluck(:user_id)
  end

  def self.parties
    ViewParty.find pluck(:view_party_id)
  end
end
