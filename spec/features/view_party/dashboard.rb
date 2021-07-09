require 'rails_helper'

RSpec.describe 'View Party on Dashboard' do
  before :all do
    @info = {
      username: 'zachtest',
      password: 'test',
      email: 'zach@g.com'
    }
    @user = User.create!(@info)
  end

  def login
    visit '/login'
    fill_in :username, with: @info[:username]
    fill_in :password, with: @info[:password]
    click_on 'commit'
  end

  context 'show view parties on dashboard' do
    it 'should show view parties hosted' do

      6.times do
        view_party = build(:view_party)
        view_party.user = @user
        view_party.save!
      end

      login

      @user.view_parties.each do |view_party|
        expect(page).to have_content(view_party.movie_name)
        expect(page).to have_content(view_party.event_time.to_formatted_s(:short))
      end
    end

    it 'should show view parties invited to' do
      user = create(:user)
      view_party = build(:view_party)
      view_party.user = user
      view_party.save!
      ViewPartyUser.create(view_party_id: view_party.id, user_id: @user.id)

      login

      expect(page).to have_content(view_party.movie_name)
      expect(page).to have_content(view_party.event_time.to_formatted_s(:short))
    end
  end

  context 'can create a view party' do
    xit 'should create a view party' do
      login
      visit '/visit/508934'

    end

  end
end