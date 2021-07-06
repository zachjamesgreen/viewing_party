require 'rails_helper'

RSpec.describe User do
  before(:each) do
    User.destroy_all
    @user_1 = User.create!(username: 'Tim', email: 'tim@mail.orb', password_digest: '123p')
    @user_2 = User.create!(username: 'Him', email: 'him@mail.orb', password_digest: '456o')
    @user_3 = User.create!(username: 'Dim', email: 'dim@mail.orb', password_digest: '789l')
  end
  describe 'relationships' do
    it { should have_many(:user_friends).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end
end