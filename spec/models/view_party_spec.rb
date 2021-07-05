require 'rails_helper'

RSpec.describe ViewParty do
  describe 'relationships' do
    it {should have_many(:view_party_users).dependent(:destroy) }
  end
end