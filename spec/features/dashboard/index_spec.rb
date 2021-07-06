require 'rails_helper'

RSpec.describe 'Dashboard Index' do
  before :each do
    #TODO login as a user to test
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

    it 'should have a viewing party section' do
      expect(page).to have_content('Viewing Parties')
    end
  end
end