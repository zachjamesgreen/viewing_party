require 'rails_helper'

RSpec.describe 'Movies' do
  # before :all do
  #   @user_info = {
  #     username: 'ABCDE',
  #     email: 'z@g.com',
  #     password: 'test'
  #   }
  #
  #   @user = User.create @user_info
  # end
  #
  # def login
  #   visit login_path
  #   fill_in :username, with: @user_info[:username]
  #   fill_in :password, with: @user_info[:password]
  #   click_on 'commit'
  # end

  context 'discover page' do
    xit 'should not allow unauth user' do
      visit discover_path
      expect(page).to have_current_path '/login'
    end

    it 'has form with search box' do
      # TODO authenticate user
      visit discover_path
      expect(page).to have_current_path('/discover')
      expect(page).to have_field 'search'
    end
  end

  context 'movies page' do
    it 'has form with search box' do
      # TODO authenticate user
      visit movies_path
      expect(page).to have_current_path('/movies')
      expect(page).to have_field 'search'
    end
  end

  context 'movie details page' do
    it 'has link to create viewing party' do
      # TODO authenticate user
      # TODO make sure to get stubbed data
      visit '/movies/1'
      expect(page).to have_link 'Create Viewing Party'
    end
  end
end