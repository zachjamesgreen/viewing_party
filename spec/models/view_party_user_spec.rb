require 'rails_helper'

RSpec.describe ViewPartyUser do
  describe 'relationships' do
    it { should belong_to(:view_party) }
    it { should belong_to(:user) }
  end

  context 'class methods' do
    it 'returns just users' do
      u1 = create(:user)
      u2 = create(:user)
      view_party = create(:view_party, user_id: u1.id)
      ViewPartyUser.create(view_party_id: view_party.id, user_id: u2.id)
      user = view_party.view_party_users.users.first
      expect(user).to eq u2
    end
  end
end