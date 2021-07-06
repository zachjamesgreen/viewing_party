require 'rails_helper'

RSpec.describe ViewPartyUser do
  describe 'relationships' do
    it { should belong_to(:view_party) }
    it { should belong_to(:user) }
  end
end