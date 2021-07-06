require 'rails_helper'

RSpec.describe 'Login page' do
  context 'has content' do
    it 'has form' do
      visit '/login'
      within 'form' do
        expect(page).to have_field(name: 'username')
        expect(page).to have_field(name: 'password')
        expect(page).to have_button(name: 'commit')
      end
    end
  end
end