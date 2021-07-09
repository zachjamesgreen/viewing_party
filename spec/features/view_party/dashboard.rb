require 'rails_helper'

RSpec.describe 'View Party on Dashboard', :vcr do
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

      expect(@user.view_parties.size).to eq 6
      @user.view_parties.each do |view_party|
        expect(page).to have_content(view_party.movie_title)
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

      expect(page).to have_content(view_party.movie_title)
      expect(page).to have_content(view_party.event_time.to_formatted_s(:short))
    end
  end

  context 'view party form flow' do
    it 'has view party form' do
      login
      visit '/movies/508934'
      click_on 'Create Viewing Party'
      expect(page).to have_current_path(new_view_party_path, ignore_query: true)

      within 'form' do
        expect(page).to have_field 'Duration'
        find('#movie_id', visible: false).value
        find('#movie_title', visible: false).value
        find("input[type=range]")
        within '#date_select' do
          expect(page).to have_content('Date')
          expect(find_all('select').size).to eq 3
        end
        within '#time_select' do
          expect(page).to have_content('Time')
          expect(find_all('select').size).to eq 2
        end
      end
    end

    it 'should create a view party' do
      duration = 0
      movie_id = ''
      movie_title = ''
      u1 = create(:user)
      u2 = create(:user)
      u3 = create(:user)
      @user.friends << [u1, u2, u3]
      login
      visit '/movies/508934'
      click_on 'Create Viewing Party'
      expect(page).to have_current_path(new_view_party_path, ignore_query: true)
      within 'form' do
        expect(page).to have_field 'Duration'
        duration = find("input[type=range]").value
        movie_id = find('#movie_id', visible: false).value
        movie_title = find('#movie_title', visible: false).value
        within '#date_select' do
          expect(page).to have_content('Date')
          expect(find_all('select').size).to eq 3
        end
        within '#time_select' do
          expect(page).to have_content('Time')
          expect(find_all('select').size).to eq 2
        end
        find("input[type=checkbox][value=#{u1.id}]").check
        find("input[type=checkbox][value=#{u2.id}]")
        find("input[type=checkbox][value=#{u3.id}]")
        click_on 'commit'
      end
      expect(page).to have_current_path(dashboard_path)
      view_party = ViewParty.where(movie_id: movie_id, movie_title: movie_title, duration: duration, user_id: @user.id).first
      expect(view_party).to be_instance_of(ViewParty)
      vp_user = ViewPartyUser.where(view_party_id: view_party.id, user_id: u1.id).first.user
      expect(vp_user).to eq u1


    end

  end
end