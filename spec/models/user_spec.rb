require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:user_friends) }
  end
end