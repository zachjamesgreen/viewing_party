require 'rails_helper'

RSpec.describe 'Dashboard Index' do
  before :each do
    #TODO login as a user to test
    User.destroy_all
    @user = User.create!(username:'Tim', email: 'tim@ex.com', password_digest: 'apples')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit '/dashboard'
  end

  context 'has content' do
    it 'welcomes the user' do
      #TODO still need authenticated user to finish test
      # expect(page).to have_content('Welcome ' + user.name)
      expect(page).to have_content('Welcome User')
    end

    it 'has link to discover movies' do
      expect(page).to have_link('Discover Movies', href: '/discover')
    end

    it 'should have a friends section' do
      expect(page).to have_content('Friends')
    end

    it 'friends section should have a search field' do
      expect(page).to have_field('email')
    end

    it 'contains a button to add a friend' do
      expect(page).to have_button('Add Friend')
    end

    it 'adds a friend' do
      sally = User.create!(username:'Sally', email: 'sally@ex.com', password_digest: 'apples')
      fill_in :email, with: 'sally@ex.com'
      click_button('Add Friend')

      expect(current_path).to eq dashboard_path
      expect(page).to have_content('Sally added as a friend!')
    end

    it 'should have a viewing party section' do
      expect(page).to have_content('Viewing Parties')
    end
  end
end